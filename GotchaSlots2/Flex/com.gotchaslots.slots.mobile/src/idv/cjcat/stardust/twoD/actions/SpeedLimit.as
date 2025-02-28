﻿package idv.cjcat.stardust.twoD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Limits a particle's maximum traveling speed.
	 */
	public class SpeedLimit extends Action2D {
		
		/**
		 * The speed limit.
		 */
		public var limit:Number;
		public function SpeedLimit(limit:Number = Number.MAX_VALUE) {
			this.limit = limit;
		}
		
		public override function preUpdate(emitter:Emitter, time:Number):void {
			limitSQ = limit * limit;
		}
		
		private var p2D:Particle2D;
		private var speedSQ:Number;
		private var limitSQ:Number;
		private var factor:Number;
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			p2D = Particle2D(particle);
			speedSQ = p2D.vx * p2D.vx + p2D.vy * p2D.vy;
			if (speedSQ > limitSQ) {
				factor = limit / Math.sqrt(speedSQ);
				p2D.vx *= factor;
				p2D.vy *= factor;
			}
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "SpeedLimit";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@limit = limit;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@limit.length()) limit = parseFloat(xml.@limit);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}