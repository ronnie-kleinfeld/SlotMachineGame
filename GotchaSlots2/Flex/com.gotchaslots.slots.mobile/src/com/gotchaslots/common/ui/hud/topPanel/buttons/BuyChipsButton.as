package com.gotchaslots.common.ui.hud.topPanel.buttons
{
	import com.gotchaslots.common.assets.hud.topPanel.TopPanelEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.MouseEvent;
	
	public class BuyChipsButton extends BaseClickableButton
	{
		// class
		public function BuyChipsButton()
		{
			super(36, 36, null, null, new TopPanelEmbed.BuyChipsNormal(), new TopPanelEmbed.BuyChipsSelected());
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			Main.Instance.Sounds.Play(SlotsSoundsManager.TopPanel_Click);
			super.OnClick(event);
			SlotsNotificationsHandler.Instance.ShowBuyChipsPopup(false, null);
		}
	}
}