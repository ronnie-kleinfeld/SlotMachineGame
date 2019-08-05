package com.gotchaslots.slots.ui.machine
{
	import com.gotchaslots.common.ui.common.components.base.BasePng;
	
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	
	public class Symbol extends BasePng
	{
		// properties
		protected override function get PngFilters():Array
		{
			return null;
		}
		
		// class
		public function Symbol(size:Rectangle, png:Bitmap)
		{
			super(size.width, size.height, png);
		}
	}
}