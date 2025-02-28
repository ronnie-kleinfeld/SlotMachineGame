package com.gotchaslots.common.ui.hud.topPanel.buttons
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.application.prices.PriceOptionsData;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.utils.ex.TimerEx;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	import com.gotchaslots.common.utils.xServices.internetTime.InternetTimeEvent;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	
	public class BuyChipsTimerRibbon extends BaseTextField
	{
		// members
		private var _checkTimer:TimerEx;
		
		// properties
		protected override function get HasFrame():Boolean
		{
			return false;
		}
		protected override function get FrameFilters():Array
		{
			return null;
		}
		protected override function get FrameCorner():Number
		{
			return 30;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.MachineBottomPanelSpin;
		}
		protected override function get TextFieldOffsetY():int
		{
			return 11;
		}
		private function get GetText():String
		{
			return "Special Offer";
		}
		
		// class
		public function BuyChipsTimerRibbon()
		{
			super(140, 55, GetText, null, 0x05e747);
			
			alpha = 0;
			filters = [new GlowFilter(0xEC9EFE, 1, 5, 5)];
			
			_checkTimer = new TimerEx(10000);
			_checkTimer.addEventListener(TimerEvent.TIMER, onCheckTimer);
			_checkTimer.start();
			DoCheckTimer();
			
			addEventListener(MouseEvent.CLICK, OnClick);
			
			Main.Instance.XServices.InternetTime.addEventListener(InternetTimeEvent.Connected, onConnected);
		}
		public override function Dispose():void
		{
			removeEventListener(MouseEvent.CLICK, OnClick);
			super.Dispose();
		}
		
		// methods
		public function DoCheckTimer():void
		{
			var priceOptions:PriceOptionsData = Main.Instance.Application.Prices.GetPriceOptions(false);
			var current:Date = Main.Instance.XServices.InternetTime.CurrentLocalDateTime;
			if (alpha == 0 && priceOptions.ShowTimerRibbon && priceOptions.Scheduler.IsInRange(current))
			{
				_checkTimer.stop();
				TweenLite.to(this, 0.4, {alpha:1});
			}
			else if (alpha == 1 && !priceOptions.ShowTimerRibbon)
			{
				TweenLite.to(this, 0.4, {alpha:0});
			}
		}
		
		// events
		protected function onCheckTimer(event:TimerEvent):void
		{
			DoCheckTimer();
		}
		protected function onConnected(event:Event):void
		{
			DoCheckTimer();
		}
		
		protected function OnClick(event:MouseEvent):void
		{
			Main.Instance.Sounds.Play(SlotsSoundsManager.TopPanel_Click);
			SlotsNotificationsHandler.Instance.ShowBuyChipsPopup(false, null);
		}
	}
}