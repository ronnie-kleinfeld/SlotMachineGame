﻿package idv.cjcat.stardust.threeD.initializers {
	import flash.display.DisplayObject;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.twoD.display.IStardustSprite;
	import idv.cjcat.stardust.twoD.utils.DisplayObjectPool;
	
	/**
	 * This is a pooled version of the <code>DisplayObjectClass</code> initializer, 
	 * which makes use of an object pool to reuse display objects, 
	 * saving time spent for instantiating new display objects.
	 * 
	 * <p>
	 * Default priority = 1;
	 * </p>
	 * 
	 * @see idv.cjcat.stardust.threeD.initializers.DisplayObjectClass3D
	 */
	public class PooledDisplayObjectClass3D extends Initializer3D {
		
		private var _constructorParams:Array;
		
		private var _pool:DisplayObjectPool;
		private var _displayObjectClass:Class;
		public function PooledDisplayObjectClass3D(displayObjectClass:Class = null, constructorParams:Array = null) {
			priority = 1;
			
			_pool = new DisplayObjectPool();
			
			this.displayObjectClass = displayObjectClass;
			this.constructorParams = constructorParams;
		}
		
		public override final function initialize(p:Particle):void {
			if (!displayObjectClass) return;
			p.target = _pool.get();
		}
		
		public function get displayObjectClass():Class { return _displayObjectClass; }
		public function set displayObjectClass(value:Class):void {
			_displayObjectClass = value;
			_pool.reset(_displayObjectClass, _constructorParams);
		}
		
		public function get constructorParams():Array { return _constructorParams; }
		public function set constructorParams(value:Array):void {
			_constructorParams = value;
			_pool.reset(_displayObjectClass, _constructorParams);
		}
		
		public override function recycleInfo(particle:Particle):void {
			var obj:DisplayObject = DisplayObject(particle.target);
			if (obj) {
				if (obj is IStardustSprite) IStardustSprite(obj).disable();
				if (obj is _displayObjectClass) _pool.recycle(obj);
			}
		}
		
		public override function get needsRecycle():Boolean {
			return true;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "PooledDisplayObjectClass3D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}