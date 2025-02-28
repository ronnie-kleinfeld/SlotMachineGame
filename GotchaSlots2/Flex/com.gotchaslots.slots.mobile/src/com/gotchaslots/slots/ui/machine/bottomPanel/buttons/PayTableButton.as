package com.gotchaslots.slots.ui.machine.bottomPanel.buttons
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.MachineInfoPageEnum;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class PayTableButton extends BaseBottomPanelButton
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.MachineBottomPanelPayTable;
		}
		
		// class
		public function PayTableButton()
		{
			super(100, 100, "Pay\nTable");
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			super.OnClick(event);
			Main.Instance.Sounds.Play(SlotsSoundsManager.Machine_BottomPanel_PayTable);
			SlotsNotificationsHandler.Instance.ShowMachineInfoPopup(MachineInfoPageEnum.NormalSymbols, Main.Instance.ActiveMachine.LobbyMachine, null);
		}
	}
}