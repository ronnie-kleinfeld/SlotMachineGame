package com.gotchaslots.slots.data.machine.totalBet
{
	import com.gotchaslots.common.data.Main;
	
	public class TotalBets
	{
		// members
		private var _totalBets:Vector.<TotalBetData>;
		
		// properties
		public function get TotalBetsLength():int
		{
			return _totalBets.length;
		}
		public function get MinTotalBet():TotalBetData
		{
			return _totalBets[0];
		}
		public function MaxTotalBet(maxBetIndex:int):TotalBetData
		{
			var result:TotalBetData;
			for (var i:int = 0; i < TotalBetsLength; i++)
			{
				var totalBet:TotalBetData = _totalBets[TotalBetsLength - i - 1];
				if (totalBet.TotalBet <= Main.Instance.Session.Wallet.GetBalance && totalBet.BetIndex <= maxBetIndex)
				{
					result = totalBet;
					break;
				}
			}
			return result;
		}
		
		// class
		public function TotalBets(maxPaylines:int)
		{
			_totalBets = new Vector.<TotalBetData>();
			for (var i:int = 1; i <= maxPaylines; i++)
			{
				for (var j:int = 0; j < Main.Instance.Application.AllowedBetsChips.length; j++)
				{
					_totalBets.push(new TotalBetData(i, j, i * Main.Instance.Application.AllowedBetsChips[j]));
				}
			}
			
			// sort by TotalBetData.TotalBet
			_totalBets.sort(TotalBetsSortCompareFunction);
		}
		public function Dispose():void
		{
			while (_totalBets && _totalBets.length > 0)
			{
				_totalBets.pop();
			}
			_totalBets = null;
			
		}
		private function TotalBetsSortCompareFunction(totalBet1:TotalBetData, totalBet2:TotalBetData):int
		{
			if (totalBet1.TotalBet < totalBet2.TotalBet)
			{
				return -1;
			}
			else if (totalBet1.TotalBet > totalBet2.TotalBet)
			{
				return 1;
			}
			else
			{
				return 0;
			}
		}
	}
}