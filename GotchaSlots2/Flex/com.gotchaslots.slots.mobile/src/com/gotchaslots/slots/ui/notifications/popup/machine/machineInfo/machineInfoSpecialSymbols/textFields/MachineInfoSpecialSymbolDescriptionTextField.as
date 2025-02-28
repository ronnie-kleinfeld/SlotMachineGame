package com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.machineInfoSpecialSymbols.textFields
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	
	import flash.text.TextField;
	
	public class MachineInfoSpecialSymbolDescriptionTextField extends BaseTextField
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.MachineInfoSymbolDescription;
		}
		
		// class
		public function MachineInfoSpecialSymbolDescriptionTextField(w:int, h:int, text:String)
		{
			super(w, h, text);
		}
	}
}