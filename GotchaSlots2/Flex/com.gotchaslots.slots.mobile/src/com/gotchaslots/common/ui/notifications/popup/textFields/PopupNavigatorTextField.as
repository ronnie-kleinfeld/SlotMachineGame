package com.gotchaslots.common.ui.notifications.popup.textFields
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	
	import flash.display.Bitmap;
	import flash.text.TextField;
	
	public class PopupNavigatorTextField extends BaseTextField
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.PopupNavigator;
		}
		
		// class
		public function PopupNavigatorTextField(w:int, text:String)
		{
			super(w, 40, text);
		}
	}
}