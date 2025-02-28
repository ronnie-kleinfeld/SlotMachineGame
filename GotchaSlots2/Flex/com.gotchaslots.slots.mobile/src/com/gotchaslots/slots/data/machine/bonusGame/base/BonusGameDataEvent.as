package com.gotchaslots.slots.data.machine.bonusGame.base
{
	import flash.events.Event;
	
	public class BonusGameDataEvent extends Event
	{
		// events
		public static const ChipsChanged:String = "a6c61f8a461e494dbee0366354f459ad";
		
		// members
		private var _value:Number;
		
		// properties
		public function get Value():Number
		{
			return _value;
		}
		
		// class
		public function BonusGameDataEvent(type:String, value:Number)
		{
			super(type);
			
			_value = value;
		}
	}
}