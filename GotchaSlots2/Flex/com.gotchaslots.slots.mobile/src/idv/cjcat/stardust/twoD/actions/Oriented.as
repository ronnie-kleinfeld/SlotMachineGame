﻿package idv.cjcat.stardust.twoD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.math.StardustMath;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Causes particles' rotation to align to their velocities.
	 * 
	 * <p>
	 * Default priority = -6;
	 * </p>
	 */
	public class Oriented extends Action2D {
		
		/**
		 * How fast the particles align to their velocities, 1 by default.
		 * 
		 * <p>
		 * 1 means immediate alignment. 0 means no alignment at all.
		 * </p>
		 */
		public var factor:Number;
		/**
		 * The rotation angle offset in degrees.
		 */
		public var offset:Number;
		public function Oriented(factor:Number = 1, offset:Number = 0) {
			priority = -6;
			
			this.factor = factor;
			this.offset = offset;
		}
		
		private var f:Number;
		private var os:Number;
		public override function preUpdate(emitter:Emitter, time:Number):void {
			f = Math.pow(factor, 1 / time);
			os = offset + 90;
		}
		
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			var p2D:Particle2D = Particle2D(particle);
			var displacement:Number = (Math.atan2(p2D.vy, p2D.vx) * StardustMath.RADIAN_TO_DEGREE + os) - p2D.rotation;
			p2D.rotation += f * displacement;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Oriented";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@factor = factor;
			xml.@offset = offset;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@factor.length()) factor = parseFloat(xml.@factor);
			if (xml.@offset.length()) offset = parseFloat(xml.@offset);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}