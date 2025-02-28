package com.gotchaslots.slots.data.machine
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.machine.CommonMachineData;
	import com.gotchaslots.common.data.machine.CommonMachineDataEvent;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.data.machine.resultMatrix.ResultMatrixHandler;
	import com.gotchaslots.slots.data.machine.totalBet.TotalBetData;
	import com.gotchaslots.slots.data.machine.totalBet.TotalBets;
	
	import flash.events.Event;
	
	public class SlotsMachineData extends CommonMachineData
	{
		// members
		private var _selectedPaylines:int;
		private var _selectedBetIndex:int;
		private var _totalBets:TotalBets;
		private var _win:Number;
		private var _isAutoSpin:Boolean;
		private var _isSpeedSpin:Boolean;
		
		private var _resultMatrixHandler:ResultMatrixHandler;
		
		private var _spinsCount:int;
		private var _freeSpinsCount:int;
		private var _chipsSpent:Number;
		
		// properties
		public function get SelectedPaylines():int
		{
			return _selectedPaylines;
		}
		public function set SelectedPaylines(value:int):void
		{
			if (_selectedPaylines != value)
			{
				if (value < 1)
				{
					value = _lobbyMachine.Paylines.Paylines.length;
				}
				else if (value > _lobbyMachine.Paylines.Paylines.length)
				{
					value = 1;
				}
				_selectedPaylines = value;
				if (TotalBetChips > Main.Instance.Session.Wallet.GetBalance)
				{
					_selectedPaylines = 1;
				}
				dispatchEvent(new Event(SlotsMachineDataEvent.SelectedPaylinesChanged));
			}
		}
		
		public function get SelectedBetChips():Number
		{
			return Main.Instance.Application.AllowedBetsChips[SelectedBetIndex];
		}
		public function get SelectedBetIndex():int
		{
			return _selectedBetIndex;
		}
		public function set SelectedBetIndex(value:int):void
		{
			if (_selectedBetIndex != value)
			{
				if (value < 0)
				{
					value = Main.Instance.Session.Wallet.GetLevel.MaxBetLevelChips.AllowedBetsChipsIndex;
				}
				else if (value >= Main.Instance.Application.AllowedBetsChips.length || value > Main.Instance.Session.Wallet.GetLevel.MaxBetLevelChips.AllowedBetsChipsIndex)
				{
					value = 0;
				}
				_selectedBetIndex = value;
				if (TotalBetChips > Main.Instance.Session.Wallet.GetBalance)
				{
					_selectedBetIndex = 1;
				}
				dispatchEvent(new Event(SlotsMachineDataEvent.SelectedBetChipsChanged));
			}
		}
		
		public function get GetTotalBets():TotalBets
		{
			return _totalBets;
		}
		
		public function get TotalBetChips():Number
		{
			return SelectedPaylines * SelectedBetChips;
		}
		
		public function get Win():Number
		{
			return _win;
		}
		public function set Win(value:Number):void
		{
			if (_win != value)
			{
				_win = value;
				dispatchEvent(new Event(CommonMachineDataEvent.WinChanged));
			}
		}
		
		public function get IsAutoSpin():Boolean
		{
			return _isAutoSpin;
		}
		public function set IsAutoSpin(value:Boolean):void
		{
			if (_isAutoSpin != value)
			{
				_isAutoSpin = value;
				dispatchEvent(new Event(SlotsMachineDataEvent.IsAutoSpinChanged));
			}
		}
		
		public function get IsSpeedSpin():Boolean
		{
			return _isSpeedSpin;
		}
		public function set IsSpeedSpin(value:Boolean):void
		{
			_isSpeedSpin = value;
		}
		
		public function get GetResultMatrixHandler():ResultMatrixHandler
		{
			return _resultMatrixHandler;
		}
		
		public function get SpinsCount():int
		{
			return _spinsCount;
		}
		public function set SpinsCount(value:int):void
		{
			_spinsCount = value;
		}
		public function get FreeSpinsCount():int
		{
			return _freeSpinsCount;
		}
		public function set FreeSpinsCount(value:int):void
		{
			_freeSpinsCount = value;
		}
		public function get ChipsSpent():Number
		{
			return _chipsSpent;
		}
		public function set ChipsSpent(value:Number):void
		{
			_chipsSpent = value;
		}
		
		// class
		public function SlotsMachineData(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			super(lobbyMachine);
			
			StartTime = Main.Instance.XServices.InternetTime.CurrentLocalMS;
			_chipsSpent = 0;
			
			_lobbyMachine = lobbyMachine;
			_totalBets = new TotalBets(lobbyMachine.Paylines.Paylines.length);
			SelectedPaylines = _lobbyMachine.Paylines.Paylines.length;
			SelectedBetIndex = Main.Instance.Session.Wallet.GetLevel.DefaultBetLevelChips.AllowedBetsChipsIndex;
			SetToMaxTotalBet();
			Win = 0;
			_resultMatrixHandler = new ResultMatrixHandler(_lobbyMachine, this);
		}
		public function Init():void
		{
			_resultMatrixHandler.Init();
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			if (_lobbyMachine && _lobbyMachine.Symbols)
			{
				_lobbyMachine.Symbols.Truncate();
			}
			
			if (_totalBets)
			{
				_totalBets.Dispose();
				_totalBets = null;
			}
			
			if (_resultMatrixHandler)
			{
				_resultMatrixHandler.Dispose();
				_resultMatrixHandler = null;
			}
		}
		
		// bottom panel
		public function SetToMaxTotalBet():TotalBetData
		{
			var maxTotalBet:TotalBetData = _totalBets.MaxTotalBet(Main.Instance.Session.Wallet.GetLevel.MaxBetLevelChips.AllowedBetsChipsIndex);
			if (maxTotalBet)
			{
				SelectedPaylines = maxTotalBet.Paylines;
				SelectedBetIndex = maxTotalBet.BetIndex;
			}
			return maxTotalBet;
		}
	}
}