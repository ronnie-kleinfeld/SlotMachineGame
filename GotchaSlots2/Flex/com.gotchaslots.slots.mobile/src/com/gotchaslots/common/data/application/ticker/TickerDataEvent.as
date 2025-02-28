package com.gotchaslots.common.data.application.ticker
{
	import flash.events.Event;
	
	public class TickerDataEvent extends Event
	{
		// members
		private var _message:String;
		private var _bubble:String;
		
		// properties
		public function get Message():String
		{
			return _message;
		}
		public function get Bubble():String
		{
			return _bubble;
		}
		
		// events
		public static const TextChanged:String = "27df8e64b6944a978638b42e2663124c";
		public static const StateLobby:String = "a94717b1cd5f4242ac5f7262424052cb";
		public static const StateMachine:String = "637937893cfa49b09c87ebdd8feb0566";
		public static const StateBonusGame:String = "fdac765d55db4ec691e9d773f537af59";
		
		// class
		public function TickerDataEvent(type:String, message:String, bubble:String)
		{
			super(type, false, false);
			
			_message = message;
			_bubble = bubble;
		}
	}
}