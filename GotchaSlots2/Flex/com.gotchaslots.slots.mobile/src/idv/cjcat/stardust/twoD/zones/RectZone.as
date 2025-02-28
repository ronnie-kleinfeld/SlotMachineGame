﻿package idv.cjcat.stardust.twoD.zones {
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.geom.MotionData2D;
	
	/**
	 * Rectangular zone.
	 */
	public class RectZone extends Zone {
		
		public var x:Number;
		public var y:Number;
		private var _randomX:Random;
		private var _randomY:Random;
		private var _width:Number;
		private var _height:Number;
		
		public function RectZone(x:Number = 0, y:Number = 0, width:Number = 640, height:Number = 480, randomX:Random = null, randomY:Random = null) {
			if (!randomX) randomX = new UniformRandom();
			if (!randomY) randomY = new UniformRandom();
			
			this.x = x;
			this.y = y;
			this.width = width;
			this.height = height;
			this.randomX = randomX;
			this.randomY = randomY;
		}
		
		public function get width():Number { return _width; }
		public function set width(value:Number):void {
			_width = value;
			updateArea();
		}
		
		public function get height():Number { return _height; }
		public function set height(value:Number):void {
			_height = value;
			updateArea();
		}
		
		public function get randomX():Random { return _randomX; }
		public function set randomX(value:Random):void {
			if (!value) value = new UniformRandom();
			_randomX = value;
		}
		
		public function get randomY():Random { return _randomY; }
		public function set randomY(value:Random):void {
			if (!value) value = new UniformRandom();
			_randomY = value;
		}
		
		protected override function updateArea():void {
			area = _width * _height;
		}
		
		public override function calculateMotionData2D():MotionData2D {
			randomX.setRange(x, x + _width);
			randomY.setRange(y, y + _height);
			return new MotionData2D(randomX.random(), randomY.random());
		}
		
		public override function contains(x:Number, y:Number):Boolean {
			if ((x < this.x) || (x > (this.x + width))) return false;
			else if ((y < this.y) || (y > (this.y + height))) return false;
			return true;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_randomX, _randomY];
		}
		
		public override function getXMLTagName():String {
			return "RectZone";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@x = x;
			xml.@y = y;
			xml.@width = width;
			xml.@height = height;
			xml.@randomX = randomX.name;
			xml.@randomY = randomY.name;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@x.length()) x = parseFloat(xml.@x);
			if (xml.@y.length()) y = parseFloat(xml.@y);
			if (xml.@width.length()) width = parseFloat(xml.@width);
			if (xml.@height.length()) height = parseFloat(xml.@height);
			if (xml.@randomX.length()) randomX = builder.getElementByName(xml.@randomX) as Random;
			if (xml.@randomY.length()) randomY = builder.getElementByName(xml.@randomY) as Random;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}