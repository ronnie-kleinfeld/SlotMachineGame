﻿package idv.cjcat.stardust.threeD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * [Abstract Class] This is an abstract class for mutual actions such as collision and mutual gravity.
	 * 
	 * <p>
	 * You can use mask to filter out which particles would interact. 
	 * Only particles whose masks' bitwise AND value is non-zero will interact.
	 * </p>
	 */
	public class MutualAction3D extends Action3D {
		
		/**
		 * Only when the distance between two particles is less than this value will these particles be processed.
		 */
		public var maxDistance:Number;
		
		public function MutualAction3D() {
			
		}
		
		private var j:ParticleIterator;
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			var p1:Particle3D = Particle3D(particle);
			var p2:Particle3D;
			var i:ParticleIterator = particle.sortedIndexIterator;
			j = i.clone();
			while (p1 = Particle3D(i.particle())) {
				p1.sortedIndexIterator.dump(j);
				j.next();
				while (p2 = Particle3D(j.particle())) {
					if ((p2.x - p1.x) <= maxDistance) {
						if (p1.mask & p2.mask) doMutualAction(p1, p2, time);
					} else {
						break;
					}
					j.next();
				}
				i.next();
			}
		}
		
		protected function doMutualAction(p1:Particle3D, p2:Particle3D, time:Number):void {
			
		}
		
		/**
		 * Tells the emitter that this action needs sorted particles.
		 */
		public override final function get needsSortedParticles():Boolean {
			return active;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "MutualAction3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@maxDistance = maxDistance;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@maxDistance.length()) maxDistance = parseFloat(xml.@maxDistance);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}