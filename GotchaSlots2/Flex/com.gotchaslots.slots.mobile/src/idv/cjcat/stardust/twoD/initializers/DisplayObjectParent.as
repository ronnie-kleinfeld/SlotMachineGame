﻿package idv.cjcat.stardust.twoD.initializers {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Specifies a specific display object container to be the parent of a particle 
	 * if the particle is initialized by the <code>DisplayObjectClass</code> initializer.
	 * 
	 * <p>
	 * Default priority = -100;
	 * </p>
	 */
	public class DisplayObjectParent extends Initializer2D {
		
		public var container:DisplayObjectContainer;
		public function DisplayObjectParent(container:DisplayObjectContainer = null) {
			priority = -100;
			this.container = container;
		}
		
		public override function initialize(particle:Particle):void {
			if (!container) return;
			var p2D:Particle2D = Particle2D(particle);
			var displayObj:DisplayObject = p2D.target as DisplayObject;
			if (!displayObj) return;
			container.addChild(displayObj);
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "DisplayObjectParent";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}