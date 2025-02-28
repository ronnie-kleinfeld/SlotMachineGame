﻿package idv.cjcat.stardust.twoD.display {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	
	public class SynchronizedMovieClip extends StardustMovieClip {
		
		protected var stopAtEnd:Boolean = false;
		private var _playHead:Number;
		
		public function SynchronizedMovieClip() {
			
		}
		
		public override function init(particle:Particle):void {
			gotoAndStop(1);
			_playHead = 1;
		}
		
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			_playHead += time;
			var max:int = totalFrames + 1;
			while (_playHead >= max) {
				if (stopAtEnd) {
					gotoAndStop(totalFrames);
					return;
				}
				_playHead -= totalFrames;
			}
			this.gotoAndStop(int(_playHead));
		}
	}
}