package com.gotchaslots.slots.data.machine.valuator.collectibles
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseScatterValuatorData;
	
	public class GoldValuatorData extends BaseScatterValuatorData
	{
		// class
		public function GoldValuatorData()
		{
			super(Main.Instance.ActiveMachine.LobbyMachine.Symbols.GoldSymbol);
		}
	}
}