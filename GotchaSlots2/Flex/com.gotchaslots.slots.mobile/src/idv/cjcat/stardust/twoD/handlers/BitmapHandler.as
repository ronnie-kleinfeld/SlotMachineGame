package idv.cjcat.stardust.twoD.handlers {
	import flash.display.DisplayObject;
	import flash.geom.ColorTransform;
	import flash.geom.Matrix;
	import idv.cjcat.stardust.common.math.StardustMath;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import flash.display.BitmapData;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.handlers.ParticleHandler;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * This handler draws display object particles into a bitmap.
	 */
	public class BitmapHandler extends ParticleHandler {
		
		/**
		 * The target bitmap to draw display object into.
		 */
		public var targetBitmapData:BitmapData;
		/**
		 * The blend mode for drawing.
		 */
		public var blendMode:String;
		
		public function BitmapHandler(targetBitmapData:BitmapData = null, blendMode:String = "normal") {
			this.targetBitmapData = targetBitmapData;
			this.blendMode = blendMode;
		}
		
		private var p2D:Particle2D;
		private var displayObj:DisplayObject;
		private var mat:Matrix = new Matrix();
		private var colorTransform:ColorTransform = new ColorTransform(1, 1, 1);
		public override function readParticle(particle:Particle):void {
			p2D = Particle2D(particle);
			
			displayObj = DisplayObject(particle.target);
				
			mat.identity();
			mat.scale(particle.scale, particle.scale);
			mat.rotate(p2D.rotation * StardustMath.DEGREE_TO_RADIAN);
			mat.translate(p2D.x, p2D.y);
			
			colorTransform.alphaMultiplier = particle.alpha;
			
			targetBitmapData.draw(displayObj, mat, colorTransform, blendMode);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "BitmapHandler";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@blendMode = blendMode;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@blendMode.length()) blendMode = xml.@blendMode;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}