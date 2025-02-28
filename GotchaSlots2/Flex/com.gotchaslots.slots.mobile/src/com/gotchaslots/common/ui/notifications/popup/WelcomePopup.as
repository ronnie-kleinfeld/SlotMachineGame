package com.gotchaslots.common.ui.notifications.popup
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;

	import flash.events.MouseEvent;

	public class WelcomePopup extends BasePopup
	{
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}

		protected override function get Title():String
		{
			return "Welcome";
		}
		protected override function get Buttons():Vector.<BaseButton>
		{
			var result:Vector.<BaseButton> = new Vector.<BaseButton>();
			result.push(new MainPopupButton("Play", OnPlayClick));
			return result;
		}

		protected override function get AutoCloseTimeout():int
		{
			return 0;
		}

		// class
		public function WelcomePopup(onClose:Function)
		{
			super(onClose);
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "Your starting bonus");
			AddBlueMessageTextField(W, "is " + FormatterHelper.NumberToMoney(Main.Instance.Session.Wallet.GetLevel.WelcomeBonusChips, 0) + " Chips");
		}

		// events
		protected function OnPlayClick(event:MouseEvent):void
		{
			Main.Instance.Session.Wallet.CollectWelcomeBonus();
			Main.Instance.Session.Rare.IsWelcomeCollected = true;
			DoRemove();
		}
	}
}
