﻿package idv.cjcat.stardust.threeD.zones {
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.geom.MotionData3D;
	import idv.cjcat.stardust.threeD.geom.MotionData3DPool;
	import idv.cjcat.stardust.threeD.geom.Vec3D;
	import idv.cjcat.stardust.threeD.geom.Vec3DPool;
	
	public class SphereSurface extends Surface {
		
		public var x:Number;
		public var y:Number;
		public var z:Number;
		
		private var _radius:Number;
		
		public function SphereSurface(x:Number = 0, y:Number = 0, z:Number = 0, radius:Number = 100) {
			this.x = x;
			this.y = y;
			this.z = z;
			this.radius = radius;
		}
		
		public function get radius():Number { return _radius;  }
		public function set radius(value:Number):void {
			_radius = value;
			updateVolume();
		}
		
		public override final function calculateMotionData3D():MotionData3D {
			var v:Vec3D = Vec3DPool.get(Math.random() - 0.5, Math.random() - 0.5, Math.random() - 0.5);
			v.length = _radius;
			Vec3DPool.recycle(v);
			
			return MotionData3DPool.get(v.x, v.y, v.z);
		}
		
		public override final function contains(x:Number, y:Number, z:Number):Boolean {
			var dx:Number = this.x - x;
			var dy:Number = this.y - y;
			var dz:Number = this.z - z;
			return ((dx * dx + dy * dy + dz * dz) == _radius * _radius);
		}
		
		protected override final function updateVolume():void {
			volume = 4 * Math.PI * _radius * _radius * virtualThickness;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [];
		}
		
		public override function getXMLTagName():String {
			return "SphereSurface";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@x = x;
			xml.@y = y;
			xml.@z = z;
			xml.@radius = radius;
			//xml.@randomR = _randomR.name;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			x = parseFloat(xml.@x);
			y = parseFloat(xml.@y);
			z = parseFloat(xml.@z);
			radius = parseFloat(xml.@radius);
			//randomR = builder.getElementByName(xml.@randomR) as Random;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}