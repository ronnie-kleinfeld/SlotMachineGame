package com.gotchaslots.slots.ui.machine.presentation
{
	import com.gotchaslots.common.assets.common.fountain.FountainEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseScatterSymbolData;
	import com.gotchaslots.slots.data.machine.valuator.scatter.MultiplierValuatorData;
	import com.gotchaslots.common.ui.common.components.freeActionScript.fountain.Fountains;
	import com.gotchaslots.slots.ui.machine.SlotsMachineView;
	import com.gotchaslots.slots.ui.machine.presentation.base.BaseScatterPresentation;
	import com.gotchaslots.common.utils.ex.TimerEx;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.TimerEvent;
	
	public class MultiplierPresentation extends BaseScatterPresentation
	{
		// properties
		protected override function get ValuatorClass():Class
		{
			return MultiplierValuatorData;
		}
		protected override function get RemoveByTween():Boolean
		{
			return true;
		}
		protected override function get BlinkSoundKey():String
		{
			return SlotsSoundsManager.Machine_Sequence_Multiplier_Blink
		}
		
		// class
		public function MultiplierPresentation(onClick:Function, onClose:Function, view:SlotsMachineView)
		{
			super(306, onClick, onClose, view);
		}
		
		// methods
		protected override function DoFlipper2():void
		{
			DoBlinkScatter(1, 4, _valuatorsHandler.Multiplier.Payboxes, BaseScatterSymbolData(_valuatorsHandler.Multiplier.Symbol));
		}
		public override function DoPostBlinkScatter():void
		{
			var fountains:Fountains = new Fountains(20, 20, FountainEmbed.Multiplier);
			addChild(fountains);
			fountains.Play();
			
			Main.Instance.ActiveMachine.Win += _valuatorsHandler.Multiplier.Chips;
			Main.Instance.Application.Ticker.PushMessage("You Won: " + FormatterHelper.NumberToMoney(Main.Instance.ActiveMachine.Win),
				"Multiplier: " + FormatterHelper.NumberToMoney(Main.Instance.ActiveMachine.SelectedBetChips) + " x " + _valuatorsHandler.Multiplier.Payout + " = " + FormatterHelper.NumberToMoney(_valuatorsHandler.Multiplier.Chips),
				true, 500);
			
			var postTimer:TimerEx = new TimerEx(2000);
			postTimer.addEventListener(TimerEvent.TIMER, OnPostTimer);
			postTimer.start();
		}
		private function OnPostTimer(event:TimerEvent):void
		{
			var postTimer:TimerEx = TimerEx(event.currentTarget);
			if (postTimer)
			{
				postTimer.Dispose();
				postTimer = null;
			}
			
			DoPostParticle();
		}
	}
}