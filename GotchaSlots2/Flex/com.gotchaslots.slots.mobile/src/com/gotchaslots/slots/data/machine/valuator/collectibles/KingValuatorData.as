package com.gotchaslots.slots.data.machine.valuator.collectibles
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseScatterValuatorData;
	
	public class KingValuatorData extends BaseScatterValuatorData
	{
		// class
		public function KingValuatorData()
		{
			super(Main.Instance.ActiveMachine.LobbyMachine.Symbols.KingSymbol);
		}
	}
}