﻿package idv.cjcat.stardust.twoD.initializers {
	import idv.cjcat.stardust.common.initializers.InitializerPriority;
	
	/**
	 * Defines priorities of some 2D initializers.
	 */
	public class Initializer2DPriority extends InitializerPriority {
		
		private static var _instance:Initializer2DPriority;
		
		public static function getInstance():Initializer2DPriority {
			if (!_instance) _instance = new Initializer2DPriority();
			return _instance;
		}
		
		public function Initializer2DPriority() {
			
		}
		
		protected override final function populatePriorities():void {
			priorities[DisplayObjectClass] = 1;
			priorities[PooledDisplayObjectClass] = 1;
			
			priorities[DisplayObjectParent] = -100;
		}
	}
}