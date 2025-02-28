package com.gotchaslots.slots.ui.machine.presentation.strike
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.valuator.strike.StrikeValuatorsData;
	import com.gotchaslots.slots.ui.machine.SlotsMachineView;
	import com.gotchaslots.slots.ui.machine.presentation.base.BasePresentation;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	public class NormalWinPresentation extends BasePresentation
	{
		// properties
		protected override function get ValuatorClass():Class
		{
			return StrikeValuatorsData;
		}
		protected override function get RemoveByTween():Boolean
		{
			return true;
		}
		
		// class
		public function NormalWinPresentation(onClick:Function, onClose:Function, view:SlotsMachineView)
		{
			super(306, onClick, onClose, view);
		}
		
		// methods
		protected override function DoPost():void
		{
			Main.Instance.ActiveMachine.Win += _valuatorsHandler.Strike.Chips;
			Main.Instance.Application.Ticker.PushMessage("You Won: " + FormatterHelper.NumberToMoney(Main.Instance.ActiveMachine.Win), "Normal Win: " + FormatterHelper.NumberToMoney(_valuatorsHandler.Strike.Chips), true);
			
			DoRemove();
		}
	}
}