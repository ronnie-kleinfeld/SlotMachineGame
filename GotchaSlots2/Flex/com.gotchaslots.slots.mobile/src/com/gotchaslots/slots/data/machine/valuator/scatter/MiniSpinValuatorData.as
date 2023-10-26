package com.gotchaslots.slots.data.machine.valuator.scatter
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseScatterValuatorData;
	
	public class MiniSpinValuatorData extends BaseScatterValuatorData
	{
		// class
		public function MiniSpinValuatorData()
		{
			super(Main.Instance.ActiveMachine.LobbyMachine.Symbols.MiniSpinSymbol);
		}
	}
}