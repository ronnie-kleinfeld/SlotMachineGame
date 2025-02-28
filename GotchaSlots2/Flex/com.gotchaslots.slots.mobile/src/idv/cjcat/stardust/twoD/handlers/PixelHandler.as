package idv.cjcat.stardust.twoD.handlers {
	import flash.display.BitmapData;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * This handler draws pixels into a <code>BitmapData</code> object according to the <code>color</code> property of <code>Particle</code> objects.
	 */
	public class PixelHandler extends ParticleHandler {
		
		/**
		 * The target bitmap to draw display object into.
		 */
		public var targetBitmapData:BitmapData;
		
		public function PixelHandler(targetBitmapData:BitmapData = null) {
			this.targetBitmapData = targetBitmapData;
		}
		
		private var p2D:Particle2D;
		private var x:int, y:int, finalColor:uint;
		
		public override function readParticle(particle:Particle):void {
			p2D = Particle2D(particle);
			
			x = int(p2D.x + 0.5);
			if ((x < 0) || (x >= targetBitmapData.width)) return;
			y = int(p2D.y + 0.5);
			if ((y < 0) || (y >= targetBitmapData.height)) return;
			
			finalColor = (particle.color & 0xFFFFFF) | uint(uint(particle.alpha * 255) << 24);
			targetBitmapData.setPixel32(x, y, finalColor);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "PixelHandler";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}