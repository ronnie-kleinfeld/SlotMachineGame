﻿package idv.cjcat.stardust.threeD.initializers {
	import idv.cjcat.stardust.common.initializers.InitializerPriority;
	
	/**
	 * Defines priorities of some 3D initializers.
	 */
	public class Initializer3DPriority extends InitializerPriority {
		
		private static var _instance:Initializer3DPriority;
		
		public static function getInstance():Initializer3DPriority {
			if (!_instance) _instance = new Initializer3DPriority();
			return _instance;
		}
		
		public function Initializer3DPriority() {
			
		}
		
		protected override final function populatePriorities():void {
			priorities[DisplayObjectClass3D] = 1;
			priorities[PooledDisplayObjectClass3D] = 1;
		}
	}
}