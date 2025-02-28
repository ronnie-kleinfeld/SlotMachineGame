package com.gotchaslots.common.ui.notifications.popup.connect
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.spline.SplinesData;
	import com.gotchaslots.common.ui.common.components.DeviceFontTextField;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class LoggedOnPopup extends BasePopup
	{
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}
		
		protected override function get Title():String
		{
			return Main.Instance.Session.Rare.IsFacebookLoginCollected ? "Welcome back" : "Welcome";
		}
		protected override function get Buttons():Vector.<BaseButton>
		{
			var result:Vector.<BaseButton> = new Vector.<BaseButton>();
			result.push(new MainPopupButton(Main.Instance.Session.Rare.IsFacebookLoginCollected ? "Play" : "Collect", OnCollectBonusClick));
			return result;
		}
		
		// class
		public function LoggedOnPopup(onClose:Function)
		{
			super(onClose);
			
			Main.Instance.XServices.Parse.FacebookConnect();
		}
		protected override function AddBody():void
		{
			AddComponent(new DeviceFontTextField(W, 30, Main.Instance.XServices.Social.FacebookName));
			
			if (!Main.Instance.Session.Rare.IsFacebookLoginCollected)
			{
				AddBlueMessageTextField(W, "Your login bonus");
				AddBlueMessageTextField(W, "is " + FormatterHelper.NumberToMoney(Main.Instance.Session.Wallet.GetLevel.FacebookConnectBonusChips, 0) + " Chips");
			}
		}
		
		// money trail
		protected override function DoPostMoneyTrails():void
		{
			Main.Instance.Session.Wallet.CollectFacebookConnectBonus();
			DoRemove();
		}
		
		// events
		private function OnCollectBonusClick(event:MouseEvent):void
		{
			if (Main.Instance.Session.Rare.IsFacebookLoginCollected)
			{
				DoRemove();
			}
			else
			{
				DoMoneyTrails(new Point(event.stageX - X, event.stageY - Y), new Point(SplinesData.BalancePoint.x - X, SplinesData.BalancePoint.y - Y + 48));
			}
		}
	}
}