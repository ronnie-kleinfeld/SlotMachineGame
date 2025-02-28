﻿package idv.cjcat.stardust.threeD.actions.triggers {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	import idv.cjcat.stardust.threeD.zones.SinglePoint3D;
	import idv.cjcat.stardust.threeD.zones.Zone3D;
	
	/**
	 * This action trigger is triggered when a particle is contained in a zone.
	 * 
	 * <p>
	 * Default priority = -6;
	 * </p>
	 */
	public class ZoneTrigger3D extends ActionTrigger3D {
		
		private var _zone:Zone3D;
		public function ZoneTrigger3D(zone:Zone3D = null) {
			priority = -6;
			
			this.zone = zone;
		}
		
		public function get zone():Zone3D { return _zone; }
		public function set zone(value:Zone3D):void {
			if (!value) value = new SinglePoint3D(0, 0);
			_zone = value;
		}
		
		public override final function testTrigger(emitter:Emitter, particle:Particle, time:Number):Boolean {
			var p3D:Particle3D = Particle3D(particle);
			return _zone.contains(p3D.x, p3D.y, p3D.z);
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_zone];
		}
		
		public override function getXMLTagName():String {
			return "ZoneTrigger3D";
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