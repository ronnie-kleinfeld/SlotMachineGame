﻿package idv.cjcat.stardust.threeD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.sd;
	import idv.cjcat.stardust.threeD.deflectors.Deflector3D;
	import idv.cjcat.stardust.threeD.geom.MotionData6D;
	import idv.cjcat.stardust.threeD.geom.MotionData6DPool;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	use namespace sd;
	
	/**
	 * This action is useful to manipulate a particle's position and velocity as you like.
	 * 
	 * <p>
	 * Each deflector returns a <code>MotionData6D</code> object, which contains four numeric properties: x, y, z, vx, vy, and vz, 
	 * according to the particle's positoin and velocity. 
	 * The particle's position and velocity are then reassigned to the new values (x, y, z) and (vx, vy, vz), respectively.
	 * </p>
	 * 
	 * <p>
	 * Deflectors can be used to create obstacles, bounding boxes, etc. 
	 * </p>
	 * 
	 * <p>
	 * Default priority = -5;
	 * </p>
	 */
	public class Deflect3D extends Action3D {
		
		/** @private */
		sd var deflectors:Array;
		
		public function Deflect3D() {
			priority = -5;
			
			deflectors = [];
		}
		
		/**
		 * Adds a deflector to the simulation.
		 * @param	deflector
		 */
		public final function addDeflector(deflector:Deflector3D):void {
			if (deflectors.indexOf(deflector) < 0) deflectors.push(deflector);
		}
		
		/**
		 * Removes a deflector from the simulation.
		 * @param	deflector
		 */
		public final function removeDeflector(deflector:Deflector3D):void {
			var index:int = deflectors.indexOf(deflector);
			if (index >= 0) deflectors.splice(index, 1);
		}
		
		/**
		 * Removes all deflectors from the simulation.
		 */
		public final function clearDeflectors():void {
			deflectors = [];
		}
		
		private var p3D:Particle3D;
		private var deflector:Deflector3D;
		private var md6D:MotionData6D;
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			p3D = Particle3D(particle);
			for each (deflector in deflectors) {
				md6D = deflector.getMotionData6D(p3D);
				if (md6D) {
					p3D.dictionary[deflector] = true;
					p3D.x = md6D.x;
					p3D.y = md6D.y;
					p3D.z = md6D.z;
					p3D.vx = md6D.vx;
					p3D.vy = md6D.vy;
					p3D.vz = md6D.vz;
					MotionData6DPool.recycle(md6D);
					md6D = null;
				} else {
					p3D.dictionary[deflector] = false;
				}
			}
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return deflectors;
		}
		
		public override function getXMLTagName():String {
			return "Deflect3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			if (deflectors.length > 0) {
				xml.appendChild(<deflectors/>);
				var deflector:Deflector3D;
				for each (deflector in deflectors) {
					xml.deflectors.appendChild(deflector.getXMLTag());
				}
			}
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			clearDeflectors();
			for each (var node:XML in xml.deflectors.*) {
				addDeflector(builder.getElementByName(node.@name) as Deflector3D);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}