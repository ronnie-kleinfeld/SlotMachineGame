package com.gotchaslots.slots.ui.machine.bottomPanel.buttons
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	public class PaylinesUpButton extends BaseBottomPanelButton
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.MachineBottomPanelPaylinesButton;
		}
		protected override function get TextFieldOffsetX():int
		{
			return 1;
		}
		protected override function get TextFieldOffsetY():int
		{
			return 4;
		}

		// class
		public function PaylinesUpButton()
		{
			super(40, 40, "+");
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			super.OnClick(event);
			Main.Instance.Sounds.Play(SlotsSoundsManager.Up);
			Main.Instance.ActiveMachine.SelectedPaylines++;
		}
	}
}