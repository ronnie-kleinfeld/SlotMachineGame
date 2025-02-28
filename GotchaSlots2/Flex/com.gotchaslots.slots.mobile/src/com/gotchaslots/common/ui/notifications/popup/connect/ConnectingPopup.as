package com.gotchaslots.common.ui.notifications.popup.connect
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.AndroidLoader;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.utils.xServices.social.SocialEvent;
	
	import flash.events.Event;
	
	public class ConnectingPopup extends BasePopup
	{
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.SmallPopup;
		}
		
		protected override function get Title():String
		{
			return "Facebook";
		}
		
		protected override function get HasCloseButton():Boolean
		{
			return true;
		}
		
		// class
		public function ConnectingPopup(onClose:Function)
		{
			super(onClose);
			
			Main.Instance.XServices.Social.addEventListener(SocialEvent.FacebookLoggedIn, OnFacebookLoggedIn);
			Main.Instance.XServices.Social.addEventListener(SocialEvent.Failed, OnFailed);
			Main.Instance.XServices.Social.Login();
		}
		public override function Dispose():void
		{
			Main.Instance.XServices.Social.addEventListener(SocialEvent.FacebookLoggedIn, OnFacebookLoggedIn);
			Main.Instance.XServices.Social.addEventListener(SocialEvent.Failed, OnFailed);
			
			super.Dispose();
		}
		
		protected override function AddBody():void
		{
			AddComponent(new Spacer(6));
			AddBlueMessageTextField(W, "Connecting");
			AddComponent(new Spacer(6));
			var androidLoader:AndroidLoader = new AndroidLoader(100, 100);
			androidLoader.x = (W - androidLoader.width) / 2;
			AddComponent(androidLoader);
		}
		
		// events
		protected function OnFacebookLoggedIn(event:Event):void
		{
			Main.Instance.XServices.Social.removeEventListener(SocialEvent.FacebookLoggedIn, OnFacebookLoggedIn);
			Main.Instance.XServices.Social.removeEventListener(SocialEvent.Failed, OnFailed);
			
			SlotsNotificationsHandler.Instance.ShowLoggedOnPopup(null);
			DoRemove();
		}
		
		protected function OnFailed(event:Event):void
		{
			Main.Instance.XServices.Social.removeEventListener(SocialEvent.FacebookLoggedIn, OnFacebookLoggedIn);
			Main.Instance.XServices.Social.removeEventListener(SocialEvent.Failed, OnFailed);
			
			DoRemove();
		}
		
		private function OnCancelClick(event:Event):void
		{
			DoRemove();
		}
	}
}