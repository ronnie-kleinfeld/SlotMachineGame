﻿package idv.cjcat.stardust.twoD.initializers {
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Sets a particle's omega value (angular velocity), in degrees per emitter step, based on the <code>random</code> property.
	 */
	public class Omega extends Initializer2D {
		
		private var _random:Random;
		public function Omega(random:Random = null) {
			this.random = random;
		}
		
		public override function initialize(particle:Particle):void {
			var p2D:Particle2D = Particle2D(particle);
			p2D.omega = _random.random();
		}
		
		public function get random():Random { return _random; }
		public function set random(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_random = value;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_random];
		}
		
		public override function getXMLTagName():String {
			return "Omega";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@random = _random.name;
			
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