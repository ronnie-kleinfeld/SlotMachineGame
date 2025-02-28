package com.gotchaslots.common.ui.notifications.popup.textFields
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	
	import flash.text.TextField;
	
	public class PopupGroupMessageCenterTextField extends BaseTextField
	{
		// properties
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		protected override function get MaxTextFieldSize():int
		{
			return 60;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.PopupGroupMessage;
		}
		
		// class
		public function PopupGroupMessageCenterTextField(w:int, text:String)
		{
			super(w, 30, text, null, 0x8330ba);
		}
	}
}