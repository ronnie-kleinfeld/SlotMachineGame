﻿package idv.cjcat.stardust.twoD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Causes a particle's rotation to change according to it's omega value (angular velocity).
	 * 
	 * <p>
	 * Default priority = -4;
	 * </p>
	 */
	public class Spin extends Action2D {
		
		/**
		 * The multiplier of spinning, 1 by default.
		 * 
		 * <p>
		 * For instance, a multiplier value of 2 causes a particle to spin twice as fast as normal.
		 * </p>
		 */
		public var multiplier:Number;
		
		public function Spin(multiplier:Number = 1) {
			priority = -4;
			
			this.multiplier = multiplier;
		}
		
		public override function preUpdate(emitter:Emitter, time:Number):void {
			factor = time * multiplier;
		}
		
		private var p2D:Particle2D;
		private var factor:Number;
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			p2D = Particle2D(particle);
			p2D.rotation += p2D.omega * factor;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Spin";
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