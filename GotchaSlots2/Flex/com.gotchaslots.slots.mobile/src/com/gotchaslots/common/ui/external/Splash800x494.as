package com.gotchaslots.common.ui.external
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.common.ui.common.components.gradientBG.RadialGradientBG;
	import com.gotchaslots.slots.utils.consts.SlotsConsts;
	
	import flash.text.TextField;
	
	public class Splash800x494 extends BaseTextField
	{
		// properties
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.SplashTitle;
		}
		protected override function get TextFieldOffsetY():int
		{
			return -100;
		}
		
		// class
		public function Splash800x494(w:int, h:int)
		{
			super(w, h, "");
			
			addChild(new RadialGradientBG(W, H, 0, 0x01704b, 0x05e747));
			
			var title:BaseTextField = new BaseTextField(W, H, "");
			title.TextField = Main.Instance.TextFields.SplashTitle;
			title.Text = "Gotcha_Slots);
			title.x = (W - title.width) / 2;
			title.y = H * SlotsConsts.GOLDEN_PART_SMALL;
			addChild(title);
		}
	}
}