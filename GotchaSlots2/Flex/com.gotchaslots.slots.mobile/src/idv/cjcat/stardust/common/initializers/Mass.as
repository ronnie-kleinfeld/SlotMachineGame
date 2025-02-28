﻿package idv.cjcat.stardust.common.initializers {
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * Sets a particle's mass value based on the <code>random</code> property.
	 *
	 * <p>
	 * A particle's mass is important in collision and gravity simulation.
	 * </p>
	 */
	public class Mass extends Initializer {
		
		private var _random:Random;
		public function Mass(random:Random = null) {
			this.random = random;
		}
		
		public function get random():Random { return _random; }
		public function set random(value:Random):void {
			if (!value) value = new UniformRandom(1, 0);
			_random = value;
		}
		
		public override final function initialize(particle:Particle):void {
			particle.mass = random.random();
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_random];
		}
		
		public override function getXMLTagName():String {
			return "Mass";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@random = random.name;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@random.length()) random = builder.getElementByName(xml.@random) as Random;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}