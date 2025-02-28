﻿package idv.cjcat.stardust.common.actions {
	import idv.cjcat.stardust.common.actions.Action;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * Causes a particle's life to decrease.
	 */
	public class Age extends Action {
		
		/**
		 * The multiplier of aging, 1 by default.
		 * 
		 * <p>
		 * For instance, a multiplier value of 2 causes a particle to age twice as fast as normal.
		 * </p>
		 * 
		 * <p>
		 * Alternatively, you can assign a negative value to the multiplier. 
		 * This causes a particle's age to "increase". 
		 * You can then use this increasing value with <code>LifeTrigger</code> and other custom actions to create various effects.
		 * </p>
		 */
		public var multiplier:Number;
		
		public function Age(multiplier:Number = 1) {
			this.multiplier = multiplier;
		}
		
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			particle.life -= time * multiplier;
			if (particle.life < 0) particle.life = 0;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Age";
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