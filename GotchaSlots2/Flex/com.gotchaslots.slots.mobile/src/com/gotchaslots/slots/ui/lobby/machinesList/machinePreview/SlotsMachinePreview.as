package com.gotchaslots.slots.ui.lobby.machinesList.machinePreview
{
	import com.gotchaslots.common.ui.lobby.machineList.machinePreview.CommonMachinePreview;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.ui.lobby.machinesList.machinePreview.components.BonusGamePendingTextField;
	import com.gotchaslots.slots.ui.lobby.machinesList.machinePreview.components.FreeSpinsPendingRibbon;
	
	public class SlotsMachinePreview extends CommonMachinePreview
	{
		// members
		private var _freeSpinsPending:FreeSpinsPendingRibbon;
		private var _bonusGamePending:BonusGamePendingTextField;
		
		// class
		public function SlotsMachinePreview(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			super(lobbyMachine);
			
			_freeSpinsPending = new FreeSpinsPendingRibbon(lobbyMachine);
			_freeSpinsPending.x = (W - _freeSpinsPending.width) / 2;
			_freeSpinsPending.y = 164;
			addChildAt(_freeSpinsPending, numChildren - 2);
			
			_bonusGamePending = new BonusGamePendingTextField(lobbyMachine);
			_bonusGamePending.x = (W - _bonusGamePending.width) / 2;
			_bonusGamePending.y = 164;
			addChildAt(_bonusGamePending, numChildren - 2);
		}
	}
}