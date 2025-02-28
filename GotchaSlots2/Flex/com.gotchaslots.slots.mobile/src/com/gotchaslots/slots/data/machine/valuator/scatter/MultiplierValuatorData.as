package com.gotchaslots.slots.data.machine.valuator.scatter
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseScatterValuatorData;
	
	public class MultiplierValuatorData extends BaseScatterValuatorData
	{
		// class
		public function MultiplierValuatorData()
		{
			super(Main.Instance.ActiveMachine.LobbyMachine.Symbols.MultiplierSymbol);
		}
		
		// methods
		public override function CalculatePaylinesPayout(selectedPaylines:int, selectedBetChips:Number):void
		{
			Chips = Payout * selectedBetChips;
		}
	}
}