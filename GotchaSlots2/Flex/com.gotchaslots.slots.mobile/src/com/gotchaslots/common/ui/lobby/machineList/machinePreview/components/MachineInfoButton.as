package com.gotchaslots.common.ui.lobby.machineList.machinePreview.components
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.MachineInfoPageEnum;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.text.TextField;
	
	public class MachineInfoButton extends BaseClickableButton
	{
		// members
		private var _lobbyMachine:SlotsBaseLobbyMachineData;
		
		// properties
		protected override function get BGFilters():Array
		{
			return null;//[new DropShadowFilter(2, 45, 0), new BevelFilter(2, 45, 0xe7c0f7, 1, 0)];
		}
		
		protected override function get HasFrame():Boolean
		{
			return false;
		}
		protected override function get FrameColorHigh():Number
		{
			return 0x8330ba;
		}
		protected override function get FrameColorLow():Number
		{
			return 0x9436ce;
		}
		protected override function get FrameThickness():Number
		{
			return 6;
		}
		protected override function get FrameCorner():Number
		{
			return 20;
		}
		protected override function get FrameFilters():Array
		{
			return [new BevelFilter(2, 45, 0xffffff, 1, 0, 0, 0, 0)];
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.HudTopPanelLevel;
		}
		private function get GetText():String
		{
			return FormatterHelper.NumberToMoney(_lobbyMachine.MaxPaylines, 0, 0);
		}
		
		// class
		public function MachineInfoButton(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			_lobbyMachine = lobbyMachine;
			
			super(49, 30, null, GetText, null, null, 0x8330ba);
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			Main.Instance.Sounds.Play(SlotsSoundsManager.MachinePreview_MachineInfoButton_Click);
			SlotsNotificationsHandler.Instance.ShowMachineInfoPopup(MachineInfoPageEnum.Information, _lobbyMachine, null);
		}
	}
}