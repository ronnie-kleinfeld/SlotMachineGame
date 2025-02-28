﻿package idv.cjcat.stardust.twoD.initializers  {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.display.IStardustSprite;
	
	public class StardustSpriteInit extends Initializer2D {
		
		public function StardustSpriteInit() {
			
		}
		
		/**
		 * Calls the <code>IStardustSprite.init()</code> method of a particle's target if the target implements the <code>IStardustSprite</code> interface.
		 * @see idv.cjcat.stardust.twoD.display.IStardustSprite
		 */
		public override function initialize(particle:Particle):void {
			var target:IStardustSprite = particle.target as IStardustSprite;
			if (target) target.init(particle);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "StardustSpriteInit";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}