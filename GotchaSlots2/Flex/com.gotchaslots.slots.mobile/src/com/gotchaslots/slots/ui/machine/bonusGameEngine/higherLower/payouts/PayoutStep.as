package com.gotchaslots.slots.ui.machine.bonusGameEngine.higherLower.payouts
{
	import com.gotchaslots.slots.assets.bonusGame.higherLower.HigherLowerEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	
	public class PayoutStep extends BaseTextField
	{
		// members
		private var _wonCheck:Bitmap;
		
		// properties
		protected override function get BGAlpha():Number
		{
			return 0.8;
		}
		
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.BonusGameHigherLowerNextSpin;
		}
		
		// class
		public function PayoutStep(w:int, payout:Number)
		{
			super(w, 34, FormatterHelper.NumberToMoney(payout), null, 0x8330ba);
			
			_wonCheck = new HigherLowerEmbed.GreenCheck();
			_wonCheck.width = _wonCheck.height = H;
			_wonCheck.x = W - _wonCheck.width - 5;
			_wonCheck.y = (H - _wonCheck.height) / 2;
			_wonCheck.alpha = 0;
			addChild(_wonCheck);
		}
		
		// methods
		public function SetAsCurrent():void
		{
			BG.graphics.beginFill(0x9d0053, 1);
			BG.graphics.drawRoundRect(0, 0, W, H, FrameCorner, FrameCorner);
			BG.filters = [new GlowFilter(0x9d0053, 1, 20, 20)];
			BG.graphics.endFill();
		}
		public function SetAsWon():void
		{
			BG.graphics.beginFill(0x00adf9, 1);
			BG.graphics.drawRoundRect(0, 0, W, H, FrameCorner, FrameCorner);
			BG.filters = null;
			BG.graphics.endFill();
			
			TweenLite.to(_wonCheck, 0.3, {alpha:1});
		}
	}
}