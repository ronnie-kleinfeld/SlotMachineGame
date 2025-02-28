package com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.machineInfoPaylines
{
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.data.machine.paylines.payline.base.BasePaylineData;
	import com.gotchaslots.slots.data.machine.paylines.paylines.base.BasePaylinesData;
	import com.gotchaslots.common.ui.common.components.base.BaseComponent;
	import com.gotchaslots.common.ui.common.components.freeActionScript.scrollable.BaseVScrollbar;
	
	public class MachineInfoPaylines extends BaseVScrollbar
	{
		// members
		private var _paylines:BasePaylinesData;
		private var _contents:int;
		
		// properties
		protected override function get Content():BaseComponent
		{
			var content:BaseComponent = new BaseComponent(421, 100 * _paylines.Paylines.length);
			
			for (var i:int = 0; i < _paylines.Paylines.length; i++)
			{
				var payline:BasePaylineData = _paylines.Paylines[i];
				
				var machineInfoPayline:MachineInfoPayline = new MachineInfoPayline(payline);
				machineInfoPayline.y = _contents * (machineInfoPayline.height + 2);
				_contents++;
				
				content.addChild(machineInfoPayline);
			}
			
			return content;
		}
		
		// class
		public function MachineInfoPaylines(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			_paylines = lobbyMachine.Paylines;
			
			super(421, 260);
		}
	}
}