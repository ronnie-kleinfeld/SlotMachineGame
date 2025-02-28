package com.gotchaslots.common.utils.numberTimer
{
	import flash.events.Event;
	
	public class NumberTimerEvent extends Event
	{
		// events
		public static const Changed:String = "d2d0ad3d36084dd5827a409fdbe93ca6";
		public static const FullReached:String = "c98548a613d947288d8b216e97a77c62";
		
		// members
		private var _value:Number;
		
		// properties
		public function get Value():Number
		{
			return _value;
		}
		
		// class
		public function NumberTimerEvent(type:String, value:Number, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			_value = value;
		}
	}
}