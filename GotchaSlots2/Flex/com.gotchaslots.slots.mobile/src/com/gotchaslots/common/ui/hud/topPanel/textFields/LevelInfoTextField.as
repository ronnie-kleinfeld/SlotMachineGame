package com.gotchaslots.common.ui.hud.topPanel.textFields
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.session.SessionDataEvent;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.BevelFilter;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;
	
	public class LevelInfoTextField extends BaseTextField
	{
		// properties
		protected override function get BGFilters():Array
		{
			return [new DropShadowFilter(2, 45, 0), new BevelFilter(2, 45, 0xe7c0f7, 1, 0)];
		}
		
		protected override function get HasFrame():Boolean
		{
			return false;
		}
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.HudTopPanelLevel;
		}
		protected override function get TextFieldOffsetY():int
		{
			return 2;
		}
		private function get GetText():String
		{
			return FormatterHelper.NumberToMoney(Main.Instance.Session.Wallet.GetLevel.LevelNumber, 0, 0);
		}
		
		// class
		public function LevelInfoTextField()
		{
			super(47, 30, GetText, null, 0x8330ba);
			
			Main.Instance.Session.Wallet.addEventListener(SessionDataEvent.LevelIncreased, OnLevelIncreased);
			addEventListener(MouseEvent.CLICK, OnClick);
		}
		public override function Dispose():void
		{
			Main.Instance.Session.Wallet.removeEventListener(SessionDataEvent.LevelIncreased, OnLevelIncreased);
			
			super.Dispose();
		}
		
		// events
		protected function OnClick(event:MouseEvent):void
		{
			Main.Instance.Sounds.Play(SlotsSoundsManager.TopPanel_Click);
			SlotsNotificationsHandler.Instance.ShowLevelInfoPopup(null);
		}
		protected function OnLevelIncreased(event:Event):void
		{
			Text = GetText;
		}
	}
}