package com.gotchaslots.common.utils.dataType
{
	public class Offset
	{
		// members
		private var _width:int;
		private var _height:int;
		
		// properties
		public function get Width():int
		{
			return _width;
		}
		public function get Height():int
		{
			return _height;
		}
		
		// class
		public function Offset(w:int, h:int)
		{
			_width = w;
			_height = h;
		}
	}
}