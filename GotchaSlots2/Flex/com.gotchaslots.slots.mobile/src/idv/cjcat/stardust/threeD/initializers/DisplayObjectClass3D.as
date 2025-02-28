﻿package idv.cjcat.stardust.threeD.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.utils.construct;
	
	/**
	 * Assigns a display object to the <code>target</code> properties of a particle. 
	 * This information can be visualized by <code>DisplayObjectRenderer3D</code>.
	 * 
	 * <p>
	 * Default priority = 1;
	 * </p>
	 * 
	 * @see idv.cjcat.stardust.threeD.renderers.DisplayObjectRenderer3D
	 */
	public class DisplayObjectClass3D extends Initializer3D {
		
		public var displayObjectClass:Class;
		public var constructorParams:Array;
		public function DisplayObjectClass3D(displayObjectClass:Class = null, constructorParams:Array = null) {
			priority = 1;
			
			this.displayObjectClass = displayObjectClass;
			this.constructorParams = constructorParams;
		}
		
		public override final function initialize(p:Particle):void {
			if (!displayObjectClass) return;
			p.target = construct(displayObjectClass, constructorParams);
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "DisplayObjectClass3D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}