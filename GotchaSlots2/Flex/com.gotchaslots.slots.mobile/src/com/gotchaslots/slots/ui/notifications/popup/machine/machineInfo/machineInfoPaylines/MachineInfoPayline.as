package com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.machineInfoPaylines
{
	import com.gotchaslots.slots.data.machine.paylines.payline.base.BasePaylineData;
	import com.gotchaslots.common.ui.common.components.base.BaseBG;
	import com.gotchaslots.common.ui.common.components.base.BasePng;
	import com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.machineInfoPaylines.textField.MachineInfoPaylineTextField;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	public class MachineInfoPayline extends BaseBG
	{
		// properties
		protected override function get HasFrame():Boolean
		{
			return false;
		}
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		
		// class
		public function MachineInfoPayline(payline:BasePaylineData)
		{
			super(383, 116, 0xffffff);
			
			addChild(new MachineInfoPaylineTextField(FormatterHelper.NumberToMoney(payline.ID + 1, 0, 0)));
			
			var png:BasePng = new BasePng(333, 116, payline.PaylineMachineInfoPng);
			payline.PaylineMachineInfoPng.x = payline.PaylineMachineInfoPng.y = 0;
			png.x = 50;
			png.width = 333;
			png.height = 116;
			addChild(png);
		}
	}
}