package com.gotchaslots.common.ui.notifications.popup.connect
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.FacebookConnectButton;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ConnectPopup extends BasePopup
	{
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}
		
		protected override function get Title():String
		{
			return "Welcome back";
		}
		protected override function get AutoCloseTimeout():int
		{
			return 60000; 
		}
		
		// class
		public function ConnectPopup(onClose:Function)
		{
			super(onClose);
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "Connect to Facebook");
			if (!Main.Instance.Session.Rare.IsFacebookLoginCollected)
			{
				AddBlueMessageTextField(W, "and get");
				AddComponent(new Spacer(10));
				AddBlueMessageTextField(W,  FormatterHelper.NumberToMoney(Main.Instance.Session.Wallet.GetLevel.FacebookConnectBonusChips, 0) + " Chips");
			}
			
			var facebookConnect:FacebookConnectButton = new FacebookConnectButton(OnFacebookClick);
			facebookConnect.x = (W - facebookConnect.width) / 2;
			facebookConnect.y = H - facebookConnect.height - 6;
			addChild(facebookConnect);
		}
		
		// events
		private function OnFacebookClick(event:Event):void
		{
			SlotsNotificationsHandler.Instance.ShowConnectingPopup(null);
			DoRemove();
		}
		protected override function OnCloseButtonClick(event:MouseEvent):void
		{
			DoRemove();
		}
	}
}