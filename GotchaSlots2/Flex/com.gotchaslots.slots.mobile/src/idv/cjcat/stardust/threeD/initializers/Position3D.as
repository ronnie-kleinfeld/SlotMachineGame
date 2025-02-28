﻿package idv.cjcat.stardust.threeD.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.geom.MotionData3D;
	import idv.cjcat.stardust.threeD.geom.MotionData3DPool;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	import idv.cjcat.stardust.threeD.zones.SinglePoint3D;
	import idv.cjcat.stardust.threeD.zones.Zone3D;
	
	/**
	 * Sets a particle's position based on the <code>zone</code> property.
	 * 
	 * <p>
	 * A particle's position is determined by a random point in the zone.
	 * </p>
	 */
	public class Position3D extends Initializer3D {
		
		private var _zone:Zone3D;
		public function Position3D(zone:Zone3D = null) {
			this.zone = zone;
		}
		
		public override final function initialize(particle:Particle):void {
			var p3D:Particle3D = Particle3D(particle);
			var md3D:MotionData3D = _zone.getPoint();
			p3D.x = md3D.x;
			p3D.y = md3D.y;
			p3D.z = md3D.z;
			MotionData3DPool.recycle(md3D);
		}
		
		public function get zone():Zone3D { return _zone; }
		public function set zone(value:Zone3D):void {
			if (!value) value = new SinglePoint3D(0, 0, 0);
			_zone = value;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_zone];
		}
		
		public override function getXMLTagName():String {
			return "Position3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@zone = _zone.name;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@zone.length()) zone = builder.getElementByName(xml.@zone) as Zone3D;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}