package com.gotchaslots.slots.ui.machine.bottomPanel.textFields
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.SlotsMachineDataEvent;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.Event;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	
	public class BetValueTextField extends BaseTextField
	{
		// properties
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.MachineBottomPanelBetValue;
		}
		private function get GetText():String
		{
			return FormatterHelper.NumberToMoney(Main.Instance.ActiveMachine.SelectedBetChips);
		}
		
		// class
		public function BetValueTextField()
		{
			super(90, 24, GetText, null, 0x00adf9);
			
			filters = [new GlowFilter(0xEC9EFE, 1, 5, 5)];
			
			Main.Instance.ActiveMachine.addEventListener(SlotsMachineDataEvent.SelectedBetChipsChanged, OnSelectedBetChipsChanged);
		}
		public override function Dispose():void
		{
			Main.Instance.ActiveMachine.removeEventListener(SlotsMachineDataEvent.SelectedBetChipsChanged, OnSelectedBetChipsChanged);
			
			super.Dispose();
		}
		
		// events
		protected function OnSelectedBetChipsChanged(event:Event):void
		{
			Text = GetText;
		}
	}
}