package com.gotchaslots.common.ui.hud.topPanel.buttons
{
	import com.gotchaslots.common.assets.hud.topPanel.TopPanelEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.MouseEvent;
	
	public class SettingsButton extends BaseClickableButton
	{
		// class
		public function SettingsButton()
		{
			super(44, 44, null, null, new TopPanelEmbed.SettingsNormal(), new TopPanelEmbed.SettingsSelected());
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			Main.Instance.Sounds.Play(SlotsSoundsManager.TopPanel_Click);
			super.OnClick(event);
			SlotsNotificationsHandler.Instance.ShowSettingsPopup(null);
		}
	}
}