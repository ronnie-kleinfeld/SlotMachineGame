package com.gotchaslots.slots.ui.machine.bonusGameEngine.higherLower.risks
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	
	import flash.text.TextField;
	
	public class NextSpinTextField extends BaseTextField
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.BonusGameHigherLowerNextSpin;
		}
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		
		// class
		public function NextSpinTextField()
		{
			super(223, 40, "? Next Spin ?", null, 0x00adf9);
		}
	}
}