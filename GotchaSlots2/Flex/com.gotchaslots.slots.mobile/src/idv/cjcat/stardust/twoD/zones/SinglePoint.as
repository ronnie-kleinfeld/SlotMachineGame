﻿package idv.cjcat.stardust.twoD.zones {
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.geom.MotionData2D;
	import idv.cjcat.stardust.twoD.geom.MotionData2DPool;
	
	/**
	 * Single point zone.
	 */
	public class SinglePoint extends Contour {
		
		public var x:Number;
		public var y:Number;
		
		public function SinglePoint(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		public override function contains(x:Number, y:Number):Boolean {
			if ((this.x == x) && (this.y == y)) return true;
			return false;
		}
		
		public override function calculateMotionData2D():MotionData2D {
			return MotionData2DPool.get(x, y);
		}
		
		protected override function updateArea():void {
			area = virtualThickness * virtualThickness * Math.PI;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------

		public override function getXMLTagName():String {
			return "SinglePoint";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@x = x;
			xml.@y = y;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@x.length()) x = parseFloat(xml.@x);
			if (xml.@y.length()) y = parseFloat(xml.@y);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
	
}