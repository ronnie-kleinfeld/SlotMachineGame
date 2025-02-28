package com.gotchaslots.slots.data.machine.valuator.symetric
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.paylines.payline.base.BasePaylineData;
	import com.gotchaslots.slots.data.machine.resultMatrix.base.BaseResultMatirxData;
	import com.gotchaslots.slots.data.machine.valuator.base.BaseValuatorsData;
	
	public class SymetricValuatorsData extends BaseValuatorsData
	{
		// members
		private var _symetricValuators:Vector.<SymetricValuatorData>;
		
		// properteis
		public function get SymetricValuators():Vector.<SymetricValuatorData>
		{
			return _symetricValuators;
		}
		
		// class
		public function SymetricValuatorsData()
		{
			super();
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			while (_symetricValuators && _symetricValuators.length > 0)
			{
				var symetricValuator:SymetricValuatorData = _symetricValuators.pop();
				symetricValuator.Dispose();
				symetricValuator = null;
			}
			_symetricValuators = null;
		}
		
		// methods
		public override function Evaluate(resultMatrix:BaseResultMatirxData):void
		{
			_symetricValuators = new Vector.<SymetricValuatorData>();
			var horizontalPaylines:Vector.<BasePaylineData> = Main.Instance.ActiveMachine.LobbyMachine.Paylines.HorizontalPaylines;
			for (var i:int = 0; i < horizontalPaylines.length; i++)
			{
				var horizontalPayline:BasePaylineData = horizontalPaylines[i];
				if (horizontalPayline.IsSymetricValuable(resultMatrix.ResultMatrix))
				{
					var symetricValuator:SymetricValuatorData = new SymetricValuatorData(horizontalPayline);
					symetricValuator.Payout = horizontalPayline.CenterSymbol(resultMatrix.ResultMatrix).PayoutByHits(horizontalPayline.ColumnsCount);
					if (symetricValuator.IsValuable)
					{
						_symetricValuators.push(symetricValuator);
					}
				}
			}
		}
		public override function CalculatePaylinesPayout(selectedPaylines:int, selectedBetChips:Number):void
		{
			if (selectedPaylines > _symetricValuators.length)
			{
				selectedPaylines = _symetricValuators.length;
			}
			
			Payout = 0;
			Chips = 0;
			for (var i:int = 0; i < selectedPaylines; i++)
			{
				_symetricValuators[i].Chips = _symetricValuators[i].Payout * selectedBetChips;
				Payout += _symetricValuators[i].Payout;
				Chips += _symetricValuators[i].Chips;
			}
		}
	}
}