package com.gotchaslots.slots.ui.machine.presentation.miniSpin
{
	import com.gotchaslots.slots.data.machine.paybox.PayboxData;
	
	import flash.events.Event;
	
	public class MiniSpinEvent extends Event
	{
		// members
		private var _symbolID:int;
		private var _paybox:PayboxData;
		
		// properties
		public function get SymbolID():int
		{
			return _symbolID;
		}
		public function get Paybox():PayboxData
		{
			return _paybox;
		}
		
		// class
		public function MiniSpinEvent(type:String, symbolID:int, paybox:PayboxData)
		{
			super(type);
			
			_symbolID = symbolID;
			_paybox = paybox;
		}
	}
}