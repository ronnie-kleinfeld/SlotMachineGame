﻿package idv.cjcat.stardust.threeD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * Causes a particle's position to change according to its velocity.
	 * 
	 * <p>
	 * Default priority = -4;
	 * </p>
	 */
	public class Move3D extends Action3D {
		
		/**
		 * The multiplier of movement, 1 by default.
		 * 
		 * <p>
		 * For instance, a multiplier value of 2 causes a particle to move twice as fast as normal.
		 * </p>
		 */
		public var multiplier:Number;
		
		public function Move3D(multiplier:Number = 1) {
			priority = -4;
			
			this.multiplier = multiplier;
		}
		
		public override final function preUpdate(emitter:Emitter, time:Number):void {
			factor = time * multiplier;
		}
		
		private var p3D:Particle3D;
		private var factor:Number;
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			p3D = Particle3D(particle);
			p3D.x += p3D.vx * factor;
			p3D.y += p3D.vy * factor;
			p3D.z += p3D.vz * factor;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Move3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@multiplier = multiplier;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@multiplier.length()) multiplier = parseFloat(xml.@multiplier);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}