package com.gotchaslots.slots.ui.lobby.machinesList.machinePreview.components
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.data.session.machines.SlotsMachineSessionDataEvent;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.common.ui.common.components.gradientBG.RadialGradientBG;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.Event;
	import flash.text.TextField;
	
	public class FreeSpinsPendingRibbon extends BaseTextField
	{
		// members
		protected var _lobbyMachine:SlotsBaseLobbyMachineData;
		
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.LobbyMachinePreviewFreeSpins;
		}
		
		// class
		public function FreeSpinsPendingRibbon(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			_lobbyMachine = lobbyMachine;
			
			addChild(new RadialGradientBG(160, 50, 15, 0x53f0fb, 0x00adf9));
			
			super(160, 50, "\n");
			
			_lobbyMachine.MachineSession.addEventListener(SlotsMachineSessionDataEvent.FreeSpinsSpinStarted, OnFreeSpinsSpinStarted);
			_lobbyMachine.MachineSession.addEventListener(SlotsMachineSessionDataEvent.FreeSpinsCollectCount, OnFreeSpinsCollectCount);
			_lobbyMachine.MachineSession.addEventListener(SlotsMachineSessionDataEvent.FreeSpinsEndPopupClosed, OnFreeSpinsEndPopupClosed);
			
			Update();
		}
		public override function Dispose():void
		{
			_lobbyMachine.MachineSession.removeEventListener(SlotsMachineSessionDataEvent.FreeSpinsSpinStarted, OnFreeSpinsSpinStarted);
			_lobbyMachine.MachineSession.removeEventListener(SlotsMachineSessionDataEvent.FreeSpinsCollectCount, OnFreeSpinsCollectCount);
			_lobbyMachine.MachineSession.removeEventListener(SlotsMachineSessionDataEvent.FreeSpinsEndPopupClosed, OnFreeSpinsEndPopupClosed);
			
			super.Dispose();
		}
		
		// methods
		private function Update():void
		{
			if (_lobbyMachine.MachineSession.FreeSpinsPendingCount > 0)
			{
				Text = FormatterHelper.NumberToMoney( _lobbyMachine.MachineSession.FreeSpinsPendingCount, 0, 0) + "\nFree Spins";
			}
			else
			{
				Text = "\n";
			}
			
			visible = _lobbyMachine.IsOpen && _lobbyMachine.MachineSession.FreeSpinsPendingCount > 0;
		}
		
		// events
		protected function OnFreeSpinsSpinStarted(event:Event):void
		{
			Update();
		}
		protected function OnFreeSpinsCollectCount(event:Event):void
		{
			Update();
		}
		protected function OnFreeSpinsEndPopupClosed(event:Event):void
		{
			Update();
		}
	}
}