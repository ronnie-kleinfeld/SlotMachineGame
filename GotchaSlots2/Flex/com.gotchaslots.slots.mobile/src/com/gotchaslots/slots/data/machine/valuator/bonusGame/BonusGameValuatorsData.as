package com.gotchaslots.slots.data.machine.valuator.bonusGame
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.paybox.PayboxData;
	import com.gotchaslots.slots.data.machine.paylines.payline.base.BasePaylineData;
	import com.gotchaslots.slots.data.machine.resultMatrix.base.BaseResultMatirxData;
	import com.gotchaslots.slots.data.machine.symbol.BonusGameSymbolData;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseValuatorsData;
	
	public class BonusGameValuatorsData extends BaseValuatorsData
	{
		// members
		protected var _bonusSymbol:BonusGameSymbolData;
		private var _bonusGameValuators:Vector.<BonusGameValuatorData>;
		
		// properteis
		public function get Symbol():BonusGameSymbolData
		{
			return _bonusSymbol;
		}
		
		public function get BonusGameValuators():Vector.<BonusGameValuatorData>
		{
			return _bonusGameValuators;
		}
		
		// class
		public function BonusGameValuatorsData()
		{
			super();
			
			_bonusSymbol = Main.Instance.ActiveMachine.LobbyMachine.Symbols.BonusGameSymbol;
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			while (_bonusGameValuators && _bonusGameValuators.length > 0)
			{
				var bonusGameValuator:BonusGameValuatorData = _bonusGameValuators.pop();
				bonusGameValuator.Dispose();
				bonusGameValuator = null;
			}
			_bonusGameValuators = null;
		}
		
		// methods
		public override function Evaluate(resultMatrix:BaseResultMatirxData):void
		{
			_bonusGameValuators = new Vector.<BonusGameValuatorData>();
			
			for (var i:int = 0; i < Main.Instance.ActiveMachine.LobbyMachine.Paylines.Paylines.length; i++)
			{
				var payline:BasePaylineData = Main.Instance.ActiveMachine.LobbyMachine.Paylines.Paylines[i];
				var payboxes:Vector.<PayboxData> = new Vector.<PayboxData>();
				for (var j:int = 0; j < payline.Payboxes.length; j++)
				{
					var paybox:PayboxData = payline.Payboxes[j];
					var symbolID:int = resultMatrix.ResultMatrix[paybox.ID];
					
					if (symbolID == _bonusSymbol.ID)
					{
						payboxes.push(paybox);
					}
				}
				
				var bonusGameValuator:BonusGameValuatorData = new BonusGameValuatorData(payboxes, payline);
				bonusGameValuator.Payout = _bonusSymbol.PayoutByHits(payboxes.length);
				_bonusGameValuators.push(bonusGameValuator);
			}
		}
		public override function CalculatePaylinesPayout(selectedPaylines:int, selectedBetChips:Number):void
		{
			if (selectedPaylines > _bonusGameValuators.length)
			{
				selectedPaylines = _bonusGameValuators.length;
			}
			
			Payout = 0;
			Chips = 0;
			for (var i:int = 0; i < selectedPaylines; i++)
			{
				_bonusGameValuators[i].Chips = _bonusGameValuators[i].Payout * selectedBetChips;
				Payout += _bonusGameValuators[i].Payout;
				Chips += _bonusGameValuators[i].Chips;
			}
		}
	}
}