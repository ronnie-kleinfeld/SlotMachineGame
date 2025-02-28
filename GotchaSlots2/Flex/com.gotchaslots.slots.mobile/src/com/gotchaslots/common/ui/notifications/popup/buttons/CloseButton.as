package com.gotchaslots.common.ui.notifications.popup.buttons
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	
	import flash.text.TextField;
	
	public class CloseButton extends BaseClickableButton
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.PopupClose;
		}
		protected override function get TextFieldOffsetX():int
		{
			return 1;
		}
		protected override function get TextFieldOffsetY():int
		{
			return 2;
		}
		protected override function get MaxTextFieldSize():int
		{
			return 60;
		}
		
		protected override function get HasNormalButton():Boolean
		{
			return true;
		}
		protected override function get NormalButtonColor():Number
		{
			return 0xc60002;
		}
		protected override function get NormalButtonFrameColor():Number
		{
			return 0x8330ba;
		}
		protected override function get NormalButtonCorner():Number
		{
			return 35;
		}
		
		protected override function get HasSelectedButton():Boolean
		{
			return true;
		}
		protected override function get SelectedButtonColor():Number
		{
			return 0xc60002;
		}
		protected override function get SelectedButtonFrameColor():Number
		{
			return 0x8330ba;
		}
		protected override function get SelectedButtonCorner():Number
		{
			return 35;
		}
		
		// class
		public function CloseButton(onClickDispatch:Function)
		{
			super(35, 35, onClickDispatch, "X");
		}
	}
}