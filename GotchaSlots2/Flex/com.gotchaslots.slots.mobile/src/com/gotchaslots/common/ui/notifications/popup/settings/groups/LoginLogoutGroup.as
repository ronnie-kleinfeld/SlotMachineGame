package com.gotchaslots.common.ui.notifications.popup.settings.groups
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.ui.notifications.popup.settings.buttons.LoginButton;
	import com.gotchaslots.common.ui.notifications.popup.settings.buttons.LogoutButton;
	import com.gotchaslots.common.ui.notifications.popup.settings.textField.PopupSettingsTextField;
	import com.gotchaslots.common.utils.xServices.social.SocialEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class LoginLogoutGroup extends BaseSettingsGroup
	{
		// members
		private var _loginButton:LoginButton;
		private var _logoutButton:LogoutButton;
		private var _popupSettings:PopupSettingsTextField;
		private var _onCloseClick:Function;
		
		// class
		public function LoginLogoutGroup(w:int, h:int, onCloseClick:Function)
		{
			super(w, h);
			
			_onCloseClick = onCloseClick;
			
			_loginButton = new LoginButton();
			_loginButton.x = 3;
			_loginButton.y = 3;
			
			_logoutButton = new LogoutButton();
			_logoutButton.x = 3;
			_logoutButton.y = 3;
			
			_popupSettings = new PopupSettingsTextField(W * 0.95, "Login");
			_popupSettings.x = W * 0.05;
			_popupSettings.y = 3;
			addChild(_popupSettings);
			
			SetState();
			
			Main.Instance.XServices.Social.addEventListener(SocialEvent.FacebookLogonChanged, OnFacebookLogonChanged);
		}
		public function Dipose():void
		{
			Main.Instance.XServices.Social.removeEventListener(SocialEvent.FacebookLogonChanged, OnFacebookLogonChanged);
			
			super.Dispose();
			
			if (_loginButton)
			{
				_loginButton.Dispose();
				_loginButton = null;
			}
			
			if (_logoutButton)
			{
				_logoutButton.Dispose();
				_logoutButton = null;
			}
		}
		
		// methods
		protected function SetState():void
		{
			if (Main.Instance.XServices.Social.IsFacebookLogon)
			{
				addChild(_logoutButton);
				_popupSettings.Text = "Logout";
			}
			else
			{
				addChild(_loginButton);
				_popupSettings.Text = "Login";
			}
		}
		
		// events
		protected function OnFacebookLogonChanged(event:Event):void
		{
			SetState();
		}
		protected override function OnClick(event:MouseEvent):void
		{
			super.OnClick(event);
			
			SetState();
			SetDisabled();
			if (Main.Instance.XServices.Social.IsFacebookLogon)
			{
				Main.Instance.XServices.Social.Logout();
			}
			else
			{
				SlotsNotificationsHandler.Instance.ShowConnectingPopup(null);
			}
			_onCloseClick(event);
		}
	}
}