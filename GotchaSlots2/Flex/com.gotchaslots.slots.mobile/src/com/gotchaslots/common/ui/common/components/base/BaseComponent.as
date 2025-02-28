package com.gotchaslots.common.ui.common.components.base
{
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	
	import flash.display.Shape;
	
	public class BaseComponent extends SpriteEx
	{
		// members
		private var _w:int;
		private var _h:int;
		
		// properties
		protected function get W():int
		{
			return _w;
		}
		protected function get H():int
		{
			return _h;
		}
		
		// class
		public function BaseComponent(w:int, h:int)
		{
			super();
			
			_w = w;
			_h = h;
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0, 0);
			shape.graphics.drawRect(0, 0, w, h);
			shape.graphics.endFill();
			addChild(shape);
		}
	}
}