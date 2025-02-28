﻿package idv.cjcat.stardust.twoD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Causes particles to decelerate.
	 * 
	 * <p>
	 * Default priority = -1;
	 * </p>
	 */
	public class Damping extends Action2D {
		
		/**
		 * In each emitter step, each particle's velocity is multiplied by this value.
		 * 
		 * <p>
		 * A value of 0 denotes no damping at all, and a value of 1 means all particles will not move at all.
		 * </p>
		 */
		public var damping:Number;
		
		public function Damping(damping:Number = 0) {
			priority = -1;
			
			this.damping = damping;
		}
		
		
		public override function preUpdate(emitter:Emitter, time:Number):void {
			damp = 1;
			if (damping) damp = Math.pow(1 - damping, time);  
		}
		
		private var damp:Number;
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			var p2D:Particle2D = Particle2D(particle);
			p2D.vx *= damp;
			p2D.vy *= damp;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Damping";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@damping = damping;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@damping.length()) damping = parseFloat(xml.@damping);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}