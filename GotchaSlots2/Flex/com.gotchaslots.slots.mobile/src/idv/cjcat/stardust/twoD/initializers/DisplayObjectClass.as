﻿package idv.cjcat.stardust.twoD.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.utils.construct;
	
	/**
	 * Assigns a display object to the <code>target</code> properties of a particle. 
	 * This information can be visualized by <code>DisplayObjectRenderer</code> and <code>BitmapRenderer</code>.
	 * 
	 * <p>
	 * Default priority = 1;
	 * </p>
	 * 
	 * @see idv.cjcat.stardust.twoD.renderers.DisplayObjectRenderer
	 * @see idv.cjcat.stardust.twoD.renderers.BitmapRenderer
	 */
	public class DisplayObjectClass extends Initializer2D {
		
		public var displayObjectClass:Class;
		public var constructorParams:Array;
		public function DisplayObjectClass(displayObjectClass:Class = null, constructorParams:Array = null) {
			priority = 1;
			
			this.displayObjectClass = displayObjectClass;
			this.constructorParams = constructorParams;
		}
		
		public override function initialize(p:Particle):void {
			if (!displayObjectClass) return;
			p.target = construct(displayObjectClass, constructorParams);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "DisplayObjectClass";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}