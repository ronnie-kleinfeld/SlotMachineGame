﻿package idv.cjcat.stardust.twoD.actions  {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.actions.Action2D;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Takes a "snapshot" of the current particle states upon the <code>takeSnapshot</code> method call. 
	 * The particle states can be later restored using the <code>SnapshotRestore</code> class.
	 * 
	 * @see idv.cjcat.stardust.twoD.actions.SnapshotRestore
	 */
	public class Snapshot extends Action2D {
		
		public function Snapshot() {
			
		}
		
		public function takeSnapshot():void {
			_snapshotTaken = false;
		}
		
		private var _snapshotTaken:Boolean = true;
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			var p2D:Particle2D = Particle2D(particle);
			
			if (_snapshotTaken) {
				skipThisAction = true;
				return;
			}
			
			p2D.dictionary[Snapshot] = new SnapshotData(p2D);
		}
		
		public override function postUpdate(emitter:Emitter, time:Number):void {
			if (!_snapshotTaken) _snapshotTaken = true;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Snapshot";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}