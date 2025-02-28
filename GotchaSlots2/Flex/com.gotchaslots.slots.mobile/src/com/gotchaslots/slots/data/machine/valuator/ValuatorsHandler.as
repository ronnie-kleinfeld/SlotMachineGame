package com.gotchaslots.slots.data.machine.valuator
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.resultMatrix.base.BaseResultMatirxData;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseValuatorsData;
	import com.gotchaslots.slots.data.machine.valuator.bonusGame.BonusGameValuatorsData;
	import com.gotchaslots.slots.data.machine.valuator.collectibles.AceValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.collectibles.GoldValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.collectibles.KingValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.column.ColumnValuatorsData;
	import com.gotchaslots.slots.data.machine.valuator.scatter.BombValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.scatter.FreeSpinsValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.scatter.MultiplierValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.scatter.MiniSpinValuatorData;
	import com.gotchaslots.slots.data.machine.valuator.strike.StrikeValuatorsData;
	import com.gotchaslots.slots.data.machine.valuator.symetric.SymetricValuatorsData;
	
	public class ValuatorsHandler extends BaseValuatorsData
	{
		// members
		private var _valuators:Vector.<BaseValuatorsData>;
		
		// properties
		public function get Strike():StrikeValuatorsData
		{
			return StrikeValuatorsData(GetValuator(StrikeValuatorsData));
		}
		public function get BonusGame():BonusGameValuatorsData
		{
			return BonusGameValuatorsData(GetValuator(BonusGameValuatorsData));
		}
		public function get FreeSpins():FreeSpinsValuatorData
		{
			return FreeSpinsValuatorData(GetValuator(FreeSpinsValuatorData));
		}
		
		public function get Column():ColumnValuatorsData
		{
			return ColumnValuatorsData(GetValuator(ColumnValuatorsData));
		}
		public function get Bomb():BombValuatorData
		{
			return BombValuatorData(GetValuator(BombValuatorData));
		}
		public function get MiniSpin():MiniSpinValuatorData
		{
			return MiniSpinValuatorData(GetValuator(MiniSpinValuatorData));
		}
		public function get Multiplier():MultiplierValuatorData
		{
			return MultiplierValuatorData(GetValuator(MultiplierValuatorData));
		}
		public function get Symetric():SymetricValuatorsData
		{
			return SymetricValuatorsData(GetValuator(SymetricValuatorsData));
		}
		
		public function get Ace():AceValuatorData
		{
			return AceValuatorData(GetValuator(AceValuatorData));
		}
		public function get Gold():GoldValuatorData
		{
			return GoldValuatorData(GetValuator(GoldValuatorData));
		}
		public function get King():KingValuatorData
		{
			return KingValuatorData(GetValuator(KingValuatorData));
		}
		
		// class
		public function ValuatorsHandler()
		{
			var valuatorsClass:Vector.<Class> = Main.Instance.ActiveMachine.LobbyMachine.ValuatorsClass;
			_valuators = new Vector.<BaseValuatorsData>();
			for (var i:int = 0; i < valuatorsClass.length; i++)
			{
				var valuatorClass:Class = valuatorsClass[i];
				_valuators.push(new valuatorClass());
			}
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			while (_valuators && _valuators.length > 0)
			{
				var valuator:BaseValuatorsData = _valuators.pop();
				valuator.Dispose();
				valuator = null;
			}
			_valuators = null;
		}
		
		// methods
		public override function Evaluate(resultMatirx:BaseResultMatirxData):void
		{
			for (var i:int = 0; i < _valuators.length; i++)
			{
				var valuator:BaseValuatorsData = _valuators[i];
				valuator.Evaluate(resultMatirx);
			}
		}
		public override function CalculatePaylinesPayout(selectedPaylines:int, selectedBetChips:Number):void
		{
			_isValuable = false;
			Payout = 0;
			Chips = 0;
			for (var i:int = 0; i < _valuators.length; i++)
			{
				_valuators[i].CalculatePaylinesPayout(selectedPaylines, selectedBetChips);
				_isValuable = _isValuable || _valuators[i].IsValuable;
				Payout += _valuators[i].Payout;
				Chips += _valuators[i].Chips;
			}
		}
		public function GetValuator(valuatorClass:Class):BaseValuatorsData
		{
			var result:BaseValuatorsData;
			
			if (_valuators)
			{
				for (var i:int = 0; i < _valuators.length; i++)
				{
					if (_valuators[i] is valuatorClass)
					{
						result = _valuators[i];
					}
				}
				
				if (result == null)
				{
					result = new valuatorClass();
				}
			}
			
			return result;
		}
	}
}