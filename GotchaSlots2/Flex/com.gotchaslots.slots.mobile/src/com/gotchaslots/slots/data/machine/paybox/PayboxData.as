package com.gotchaslots.slots.data.machine.paybox
{
	import com.gotchaslots.common.utils.dataType.BaseIDData;
	
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	public class PayboxData extends BaseIDData
	{
		// members
		private var _rectangle:Rectangle;
		private var _row:int;
		private var _column:int;
		
		// properties
		public function get Rect():Rectangle
		{
			return _rectangle;
		}
		public function get LeftCenter():Point
		{
			return new Point(Rect.x, Rect.y + Rect.height / 2);
		}
		public function get Center():Point
		{
			return new Point(Rect.x + Rect.width / 2, Rect.y + Rect.height / 2);
		}
		public function get RightCenter():Point
		{
			return new Point(Rect.x + Rect.width, Rect.y + Rect.height / 2);
		}
		
		public function PngLocation():Point
		{
			return new Point(Rect.x - 3, Rect.y - 3);
		}
		
		public function get Row():int
		{
			return _row;
		}
		public function get Column():int
		{
			return _column;
		}
		
		// class
		public function PayboxData(id:int, x:int, y:int, w:int, h:int, row:int, column:int)
		{
			super(id);
			
			_rectangle = new Rectangle(x, y, w, h);
			_row = row;
			_column = column;
		}
	}
}