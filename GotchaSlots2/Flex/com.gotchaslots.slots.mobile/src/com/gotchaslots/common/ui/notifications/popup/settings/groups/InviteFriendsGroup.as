package com.gotchaslots.common.ui.notifications.popup.settings.groups
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.notifications.popup.settings.buttons.InviteFriendsButton;
	import com.gotchaslots.common.ui.notifications.popup.settings.textField.PopupSettingsTextField;
	
	import flash.events.MouseEvent;
	
	public class InviteFriendsGroup extends BaseSettingsGroup
	{
		// class
		public function InviteFriendsGroup(w:int, h:int)
		{
			super(w, h);
			
			var inviteFriendsButton:InviteFriendsButton = new InviteFriendsButton();
			inviteFriendsButton.x = 3;
			inviteFriendsButton.y = 3;
			addChild(inviteFriendsButton);
			
			var sound:PopupSettingsTextField = new PopupSettingsTextField(W, "Invite Friends");
			sound.x = W * 0.05;
			sound.y = 3;
			addChild(sound);
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			super.OnClick(event);
			
			Main.Instance.XServices.Social.Invite();
		}
	}
}