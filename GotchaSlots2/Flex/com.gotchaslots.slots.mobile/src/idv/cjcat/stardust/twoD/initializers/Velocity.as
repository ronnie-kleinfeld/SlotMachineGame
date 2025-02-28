﻿package idv.cjcat.stardust.twoD.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.geom.MotionData2D;
	import idv.cjcat.stardust.twoD.geom.MotionData2DPool;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	import idv.cjcat.stardust.twoD.zones.Zone;
	
	/**
	 * Sets a particle's velocity based on the <code>zone</code> property.
	 * 
	 * <p>
	 * A particle's velocity is determined by a random point in the zone. 
	 * (The vector pointing from the origin to the random point).
	 * </p>
	 */
	public class Velocity extends Initializer2D {
		
		private var _zone:Zone;
		public function Velocity(zone:Zone = null) {
			this.zone = zone;
		}
		
		public override function initialize(particle:Particle):void {
			var p2D:Particle2D = Particle2D(particle);
			var md2D:MotionData2D = zone.getPoint();
			p2D.vx = md2D.x;
			p2D.vy = md2D.y;
			MotionData2DPool.recycle(md2D);
		}
		
		public function get zone():Zone { return _zone; }
		public function set zone(value:Zone):void {
			if (!value) value = new SinglePoint(0, 0);
			_zone = value;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_zone];
		}
		
		public override function getXMLTagName():String {
			return "Velocity";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@zone = zone.name;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@zone.length()) zone = builder.getElementByName(xml.@zone) as Zone;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}