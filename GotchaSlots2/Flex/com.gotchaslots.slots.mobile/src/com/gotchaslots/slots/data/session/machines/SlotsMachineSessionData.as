package com.gotchaslots.slots.data.session.machines
{
	import com.gotchaslots.common.data.session.base.ISession;
	import com.gotchaslots.common.data.session.machines.CommonMachineSessionData;
	import com.gotchaslots.common.data.session.machines.MachinesSessionCollection;
	
	public class SlotsMachineSessionData extends CommonMachineSessionData implements ISession
	{
		// members
		private var _freeSpinsWonCount:int;				// serialize
		private var _freeSpinsPlayedCount:int;			// serialize
		private var _freeSpinsChipsWon:Number;			// serialize
		
		private var _isBonusGamePending:Boolean;		// serialize
		
		// properties
		public function get FreeSpinsWonCount():int
		{
			return _freeSpinsWonCount;
		}
		public function get FreeSpinsPlayedCount():int
		{
			return _freeSpinsPlayedCount;
		}
		public function get FreeSpinsPendingCount():int
		{
			if (_freeSpinsWonCount > _freeSpinsPlayedCount)
			{
				return _freeSpinsWonCount - _freeSpinsPlayedCount;
			}
			else
			{
				return 0;
			}
		}
		public function get FreeSpinsChipsSum():Number
		{
			return _freeSpinsChipsWon;
		}
		
		public function get IsBonusGamePending():Boolean
		{
			return _isBonusGamePending;
		}
		
		// class
		public function SlotsMachineSessionData(id:int, machinesSessionCollection:MachinesSessionCollection)
		{
			super(id, machinesSessionCollection);
			
			_freeSpinsWonCount = 0;
			_freeSpinsPlayedCount = 0;
			_freeSpinsChipsWon = 0;
			
			_isBonusGamePending = false;
		}
		
		// serialize
		public override function Deserialize(object:Object):void
		{
			_id = object.ID;
			_isInvite4Unlocked = object.IsInvite4Unlocked;
			_newMachine = object.NewMachine;
			_freeSpinsWonCount = object._freeSpinsWonCount;
			_freeSpinsPlayedCount = object._freeSpinsPlayedCount;
			_freeSpinsChipsWon = object._freeSpinsChipsWon;
			_isBonusGamePending = object.IsBonusGamePending;
		}
		public override function Serialize():Object
		{
			var result:Object = new Object();
			result.ID = ID;
			result.IsInvite4Unlocked = _isInvite4Unlocked;
			result.NewMachine = _newMachine;
			result._freeSpinsWonCount = _freeSpinsWonCount;
			result._freeSpinsPlayedCount = _freeSpinsPlayedCount;
			result._freeSpinsChipsWon = _freeSpinsChipsWon;
			result.IsBonusGamePending = _isBonusGamePending;
			return result;
		}
		
		// free spins
		public function FreeSpinsSpinStarted():void
		{
			if (FreeSpinsPendingCount > 0)
			{
				_freeSpinsPlayedCount++;
				dispatchEvent(new SlotsMachineSessionDataEvent(SlotsMachineSessionDataEvent.FreeSpinsSpinStarted, this, -1));
				_machinesSessionCollection.Save();
			}
		}
		public function FreeSpinsCollectCount(wonCount:int):void
		{
			_freeSpinsWonCount += wonCount;
			dispatchEvent(new SlotsMachineSessionDataEvent(SlotsMachineSessionDataEvent.FreeSpinsCollectCount, this, wonCount));
			_machinesSessionCollection.Save();
		}
		public function FreeSpinsCollectChips(chipsWon:Number):void
		{
			_freeSpinsChipsWon += chipsWon;
			_machinesSessionCollection.Save();
		}
		public function FreeSpinsEndPopupClosed():void
		{
			_freeSpinsWonCount = 0;
			_freeSpinsPlayedCount = 0;
			_freeSpinsChipsWon = 0;
			dispatchEvent(new SlotsMachineSessionDataEvent(SlotsMachineSessionDataEvent.FreeSpinsEndPopupClosed, this, 0));
			_machinesSessionCollection.Save();
		}
		
		// bonus game
		public function BonusGameWon():void
		{
			_isBonusGamePending = true;
			dispatchEvent(new SlotsMachineSessionDataEvent(SlotsMachineSessionDataEvent.BonusGameWon, this, 0));
			dispatchEvent(new SlotsMachineSessionDataEvent(SlotsMachineSessionDataEvent.BonusGameChanged, this, 0));
			_machinesSessionCollection.Save();
		}
		
		// fix
		public override function Fix():void
		{
		}
	}
}