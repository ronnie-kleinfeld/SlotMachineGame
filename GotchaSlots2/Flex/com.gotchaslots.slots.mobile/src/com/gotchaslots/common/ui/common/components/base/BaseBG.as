package com.gotchaslots.common.ui.common.components.base
{
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	
	import flash.display.GradientType;
	import flash.display.Shape;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	
	public class BaseBG extends BaseComponent
	{
		// members
		private var _bg:Shape;
		private var _matrix:Matrix;
		protected var _frame:SpriteEx;
		
		// properties
		protected function get BG():Shape
		{
			return _bg;
		}
		protected function get BGAlpha():Number
		{
			return 1;
		}
		protected function get BGFilters():Array
		{
			return null;
		}
		
		protected function get HasFrame():Boolean
		{
			return false;
		}
		protected function get FrameColorHigh():Number
		{
			return 0xFFFF00;
		}
		protected function get FrameColorLow():Number
		{
			return 0x00FFFF;
		}
		protected function get FrameThickness():Number
		{
			return 3;
		}
		protected function get FrameCorner():Number
		{
			return 0;
		}
		protected function get FrameFilters():Array
		{
			return [new DropShadowFilter(4, 45, 0x000000), new BevelFilter(4, 45, 0xffffff, 1, 0)];
		}
		
		// class
		public function BaseBG(w:int, h:int, bgColor:Number = Number.NaN)
		{
			super(w, h);
			
			AddBG(bgColor);
			AddFrame();
		}
		private function AddBG(bgColor:Number):void
		{
			_bg = new Shape();
			_bg.graphics.beginFill(isNaN(bgColor) ? 0x00ff00 : bgColor, isNaN(bgColor) ? 0 : 1);
			_bg.graphics.drawRoundRect(0, 0, W, H, FrameCorner, FrameCorner);
			_bg.graphics.endFill();
			_bg.filters = BGFilters;
			_bg.alpha = BGAlpha;
			addChild(_bg);
		}
		private function AddFrame():void
		{
			if (HasFrame)
			{
				_frame = new SpriteEx();
				_frame.filters = FrameFilters;
				
				_matrix = new Matrix();
				_matrix.createGradientBox(0, 0, 90);
				
				_frame.graphics.lineStyle(FrameThickness);
				
				_frame.graphics.lineGradientStyle(GradientType.LINEAR, [FrameColorHigh, FrameColorLow], [100, 100], [0x00, 0xFF], _matrix);
				_frame.graphics.beginFill(0, 0);
				_frame.graphics.drawRoundRect(0, 0, W, H, FrameCorner, FrameCorner);
				_frame.graphics.endFill();
				addChild(_frame);
			}
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			_matrix = null;
		}
	}
}