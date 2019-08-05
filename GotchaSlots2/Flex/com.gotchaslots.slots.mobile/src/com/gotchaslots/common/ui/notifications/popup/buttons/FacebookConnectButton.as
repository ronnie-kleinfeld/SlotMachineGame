package com.gotchaslots.common.ui.notifications.popup.buttons
{
	import com.gotchaslots.common.assets.notifications.popup.PopupEmbed;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;

	public class FacebookConnectButton extends BaseClickableButton
	{
		// class
		public function FacebookConnectButton(onClickDispatch:Function)
		{
			super(280, 109, onClickDispatch, "", new PopupEmbed.FacebookConnectNormal(), new PopupEmbed.FacebookConnectSelected());
		}
	}
}