﻿package idv.cjcat.stardust.threeD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.geom.Vec3D;
	import idv.cjcat.stardust.threeD.geom.Vec3DPool;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * Accelerates particles along their velocity directions.
	 */
	public class Accelerate3D extends Action3D {
		
		/**
		 * The amount of acceleration in each emitter step.
		 */
		public var acceleration:Number;
		
		public function Accelerate3D(acceleration:Number = 0.1) {
			this.acceleration = acceleration;
		}
		
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			var p3D:Particle3D = Particle3D(particle);
			var v:Vec3D = Vec3DPool.get(p3D.vx, p3D.vy, p3D.vz);
			if (v.length > 0) {
				v.length += acceleration * time;
				p3D.vx = v.x;
				p3D.vy = v.y;
				p3D.vz = v.z;
			}
			Vec3DPool.recycle(v);
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Accelerate3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@acceleration = acceleration;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@acceleration.length()) acceleration = parseFloat(xml.@acceleration);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}