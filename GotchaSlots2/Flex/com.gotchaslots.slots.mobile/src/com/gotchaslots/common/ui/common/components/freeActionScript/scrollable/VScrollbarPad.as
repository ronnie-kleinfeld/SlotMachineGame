package com.gotchaslots.common.ui.common.components.freeActionScript.scrollable
{
	import com.gotchaslots.common.ui.common.components.base.BaseBG;
	
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	
	public class VScrollbarPad extends BaseBG
	{
		// properties
		protected override function get BGFilters():Array
		{
			return [new BevelFilter(4, 45, 0xffffff, 1, 0)];
		}
		protected override function get FrameCorner():Number
		{
			return W;
		}
		
		// class
		public function VScrollbarPad(w:int, h:int, bgColor:Number = Number.NaN)
		{
			super(w, h, bgColor);
		}
	}
}