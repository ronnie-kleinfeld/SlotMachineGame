﻿package idv.cjcat.stardust.common.math {
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * This class generates uniformly distrubuted random numbers.
	 */
	public class UniformRandom extends Random {
		
		/**
		 * The expected value of the random number.
		 */
		public var center:Number;
		/**
		 * The variation of the random number.
		 * 
		 * <p>
		 * The range of the generated random number is [center - radius, center + radius].
		 * </p>
		 */
		public var radius:Number;
		
		public function UniformRandom(center:Number = 0.5, radius:Number = 0) {
			this.center = center;
			this.radius = radius;
		}
		
		public override final function random():Number {
			if (radius) return radius * 2 * (Math.random() - 0.5) + center;
			else return center;
		}
		
		public override function setRange(lowerBound:Number, upperBound:Number):void {
			var diameter:Number = upperBound - lowerBound;
			radius = 0.5 * diameter;
			center = lowerBound + radius;
		}
		
		public override function getRange():Array {
			return [center - radius, center + radius];
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "UniformRandom";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@center = center;
			xml.@radius = radius;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@center.length()) center = parseFloat(xml.@center);
			if (xml.@radius.length()) radius = parseFloat(xml.@radius);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}