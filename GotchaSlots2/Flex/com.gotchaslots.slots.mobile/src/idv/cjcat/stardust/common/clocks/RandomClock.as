﻿package idv.cjcat.stardust.common.clocks {
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * This clock causes the emitter to create particles in random number based on the <code>random</code> property.
	 */
	public class RandomClock extends Clock {
		
		private var _random:Random;
		
		public function RandomClock(random:Random = null) {
			this.random = random;
		}
		
		/**
		 * Returns a random number based on the <code>random</code> property.
		 * @param	time
		 * @return
		 */
		public override final function getTicks(time:Number):int {
			var rand:Number = random.random() * time;
			var floor:int = rand | 0;
			return floor + int(((rand - floor) > Math.random())?(1):(0));
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
			return "RandomClock";
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