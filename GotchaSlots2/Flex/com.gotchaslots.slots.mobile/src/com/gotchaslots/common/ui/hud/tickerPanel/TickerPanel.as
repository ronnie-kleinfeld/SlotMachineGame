package com.gotchaslots.common.ui.hud.tickerPanel
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.application.ticker.TickerDataEvent;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.filters.BevelFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	
	public class TickerPanel extends BaseTextField
	{
		// properties
		protected override function get HasFrame():Boolean
		{
			return true;
		}
		protected override function get FrameColorHigh():Number
		{
			return 0x8330ba;
		}
		protected override function get FrameColorLow():Number
		{
			return 0x8330ba;
		}
		protected override function get FrameThickness():Number
		{
			return 4;
		}
		protected override function get FrameFilters():Array
		{
			return [new BevelFilter(4, 45, 0x8330ba, 1, 0)];
		}
		protected override function get FrameCorner():Number
		{
			return 40;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.HudTicker;
		}
		protected override function get MaxTextFieldSize():int
		{
			return 60;
		}
		
		// class
		public function TickerPanel()
		{
			super(640, 36, "TickerPanel", null, 0xfdeaf4);
			
			filters = [new GlowFilter(0xEC9EFE, 1, 5, 5)];
			
			Main.Instance.Application.Ticker.addEventListener(TickerDataEvent.TextChanged, OnTickerChanged);
			Main.Instance.Application.Ticker.addEventListener(TickerDataEvent.StateLobby, OnStateLobby);
			Main.Instance.Application.Ticker.addEventListener(TickerDataEvent.StateMachine, OnStateMachine);
			Main.Instance.Application.Ticker.addEventListener(TickerDataEvent.StateBonusGame, OnStateBonusGame);
			Main.Instance.Application.Ticker.Start();
		}
		public override function Dispose():void
		{
			Main.Instance.Application.Ticker.removeEventListener(TickerDataEvent.TextChanged, OnTickerChanged);
			Main.Instance.Application.Ticker.removeEventListener(TickerDataEvent.StateLobby, OnStateLobby);
			Main.Instance.Application.Ticker.removeEventListener(TickerDataEvent.StateMachine, OnStateMachine);
			Main.Instance.Application.Ticker.removeEventListener(TickerDataEvent.StateBonusGame, OnStateBonusGame);
			
			super.Dispose();
		}
		
		// events
		protected function OnTickerChanged(event:TickerDataEvent):void
		{
			Text = event.Message;
			
			if (event.Bubble && event.Bubble.length > 0)
			{
				var bubblingTicker:BubblingTickerTextField = new BubblingTickerTextField();
				bubblingTicker.x = (800 - bubblingTicker.width ) /2;
				bubblingTicker.y = 337;
				bubblingTicker.Text = event.Bubble;
				parent.addChild(bubblingTicker);
				bubblingTicker.Bubble(-50, Number.NaN);
				Main.Instance.Sounds.Play(SlotsSoundsManager.Machine_Sequence_ToWin);
			}
		}
		
		protected function OnStateLobby(event:Event):void
		{
			TweenLite.to(this, 0.5, {y:330});
		}
		protected function OnStateMachine(event:Event):void
		{
			TweenLite.to(this, 0.5, {y:330});
		}
		protected function OnStateBonusGame(event:Event):void
		{
			TweenLite.to(this, 0.5, {y:452});
		}
	}
}