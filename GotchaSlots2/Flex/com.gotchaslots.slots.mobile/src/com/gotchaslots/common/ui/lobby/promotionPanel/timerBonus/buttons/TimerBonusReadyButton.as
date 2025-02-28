package com.gotchaslots.common.ui.lobby.promotionPanel.timerBonus.buttons
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.MainEvent;
	import com.gotchaslots.slots.data.machine.spline.SplinesData;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	import com.gotchaslots.common.ui.common.components.stardust.moneyTrail.MoneyTrail;
	import com.gotchaslots.common.utils.helpers.DisplayObjectHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.text.TextField;
	
	public class TimerBonusReadyButton extends BaseClickableButton
	{
		// properties
		protected override function get HasNormalButton():Boolean
		{
			return true;
		}
		protected override function get NormalButtonColor():Number
		{
			return 0x9436ce;
		}
		protected override function get NormalButtonFrameColor():Number
		{
			return 0x8330ba;
		}
		protected override function get NormalButtonCorner():Number
		{
			return 20;
		}
		
		protected override function get HasSelectedButton():Boolean
		{
			return true;
		}
		protected override function get SelectedButtonColor():Number
		{
			return 0x8330ba;
		}
		protected override function get SelectedButtonFrameColor():Number
		{
			return 0x9436ce;
		}
		protected override function get SelectedButtonCorner():Number
		{
			return 20;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.LobbyTimerBonusReady;
		}
		
		// class
		public function TimerBonusReadyButton(w:int, h:int)
		{
			super(w, h, null, "Timer Bonus\nReady\nCollect Now");
		}
		
		// events
		protected override function OnClick(event:MouseEvent):void
		{
			Main.Instance.Sounds.Play(SlotsSoundsManager.TimerBonus_TimerBonus_Collect);
			
			removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			removeEventListener(MouseEvent.ROLL_OUT, OnRollOut);
			removeEventListener(MouseEvent.CLICK, OnClick);
			
			var moneyTrail:MoneyTrail = new MoneyTrail(length, new Point(event.stageX - 587, event.stageY - 316), new Point(-200, -200), new Point(SplinesData.BalancePoint.x - 587, SplinesData.BalancePoint.y - 48 - 316));
			moneyTrail.addEventListener(Event.COMPLETE, OnMoneyTrailComplete);
			addChild(moneyTrail);
		}
		private function OnMoneyTrailComplete(event:Event):void
		{
			var moneyTrail:MoneyTrail = MoneyTrail(event.currentTarget);
			moneyTrail.removeEventListener(Event.COMPLETE, OnMoneyTrailComplete);
			DisplayObjectHelper.SafeDisposeChild(this, moneyTrail);
			
			Main.Instance.addEventListener(MainEvent.Timer, OnPostTimer);
		}
		private function OnPostTimer(event:Event):void
		{
			Main.Instance.removeEventListener(MainEvent.Timer, OnPostTimer);
			
			Main.Instance.Session.Rare.CollectTimerBonus();
		}
	}
}