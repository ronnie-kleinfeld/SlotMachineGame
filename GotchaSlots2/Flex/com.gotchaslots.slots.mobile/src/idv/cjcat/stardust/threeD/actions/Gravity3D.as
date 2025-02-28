﻿package idv.cjcat.stardust.threeD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.sd;
	import idv.cjcat.stardust.threeD.fields.Field3D;
	import idv.cjcat.stardust.threeD.geom.MotionData3D;
	import idv.cjcat.stardust.threeD.geom.MotionData3DPool;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	use namespace sd;
	
	/**
	 * Applies accelerations to particles according to the associated gravity fields.
	 * 
	 * <p>
	 * Default priority = -3;
	 * </p>
	 */
	public class Gravity3D extends Action3D {
		
		/** @private */
		sd var fields:Array;
		
		public function Gravity3D() {
			priority = -3;
			
			fields = [];
		}
		
		/**
		 * Adds a gravity field to the simulation.
		 * @param	field
		 */
		public final function addField(field:Field3D):void {
			if (fields.indexOf(field) < 0) fields.push(field);
		}
		
		/**
		 * Removes a gravity field from the simulation.
		 * @param	field
		 */
		public final function removeField(field:Field3D):void {
			var index:int = fields.indexOf(field);
			if (index >= 0) fields.splice(index, 1);
		}
		
		/**
		 * Removes all gravity fields from the simulation.
		 */
		public final function clearFields():void {
			fields = [];
		}
		
		private var p3D:Particle3D;
		private var field:Field3D;
		private var md3D:MotionData3D;
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			p3D = Particle3D(particle);
			for each (field in fields) {
				md3D = field.getMotionData3D(p3D);
				if (md3D) {
					p3D.vx += md3D.x * time;
					p3D.vy += md3D.y * time;
					p3D.vz += md3D.z * time;
					MotionData3DPool.recycle(md3D);
					md3D = null;
				}
			}
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return fields;
		}
		
		public override function getXMLTagName():String {
			return "Gravity3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			if (fields.length > 0) {
				xml.appendChild(<fields/>);
				var field:Field3D;
				for each (field in fields) {
					xml.fields.appendChild(field.getXMLTag());
				}
			}
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			clearFields();
			for each (var node:XML in xml.fields.*) {
				addField(builder.getElementByName(node.@name) as Field3D);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}