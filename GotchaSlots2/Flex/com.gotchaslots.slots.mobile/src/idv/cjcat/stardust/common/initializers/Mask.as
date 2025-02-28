﻿package idv.cjcat.stardust.common.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * Sets a particle's mask value based on the <code>random</code> property.
	 *
	 * <p>
	 * A particle would be affected by an action only if the bitwise AND of their masks is non-zero. 
	 * </p>
	 */
	public class Mask extends Initializer {
		
		private var _mask:int;
		public function Mask(mask:int = 1) {
			priority = 1;
			
			_mask = mask;
		}
		
		public override final function initialize(particle:Particle):void {
			particle.mask = _mask;
		}
		
		/**
		 * A particle's mask is set to this value.
		 * 
		 * <p>
		 * Do not confuse this property with the <code>mask</code> property.
		 * The <code>mask</code> property is this initializer's own mask.
		 * </p>
		 */
		public function get mask():int { return _mask; }
		public function set mask(value:int):void {
			if (value < 0) value = 0;
			_mask = value;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Mask";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@mask = mask;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@mask.length()) mask = parseInt(xml.@mask);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}