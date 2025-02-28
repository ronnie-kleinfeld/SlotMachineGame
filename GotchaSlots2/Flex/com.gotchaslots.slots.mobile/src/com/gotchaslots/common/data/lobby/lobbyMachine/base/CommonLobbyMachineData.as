package com.gotchaslots.common.data.lobby.lobbyMachine.base
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.machine.CommonMachineDataEvent;
	import com.gotchaslots.common.data.session.SessionDataEvent;
	import com.gotchaslots.common.data.session.level.LevelData;
	import com.gotchaslots.common.data.session.machines.CommonMachineSessionDataEvent;
	import com.gotchaslots.common.utils.dataType.BaseIDData;
	import com.gotchaslots.slots.data.session.machines.SlotsMachineSessionData;
	import com.gotchaslots.slots.data.session.machines.SlotsMachineSessionDataEvent;
	
	import flash.events.Event;

	public class CommonLobbyMachineData extends BaseIDData
	{
		// members
		private var _machineName:String;
		private var _factor:Number;
		private var _opensOnLevel:LevelData;
		private var _isComingSoon:Boolean;
		private var _depreciationRatio:Number;
		
		// properties
		public function get MachineSession():SlotsMachineSessionData
		{
			return SlotsMachineSessionData(Main.Instance.Session.Machines.MachineSessionByID(ID));
		}
		
		public final function get MachineName():String
		{
			return _machineName;
		}
		protected final function get Factor():Number
		{
			return _factor;
		}
		public final function get OpensOnLevel():LevelData
		{
			return _opensOnLevel;
		}
		
		public final function get IsCommingSoon():Boolean
		{
			return _isComingSoon;
		}

		public final function get DepreciationRatio():Number
		{
			return _depreciationRatio;
		}
		
		// preview status
		public final function get IsOpen():Boolean
		{
			return MachineSession.IsInvite4Unlocked || !IsCommingSoon && Main.Instance.Session.Wallet.GetLevel.LevelNumber >= OpensOnLevel.LevelNumber;
		}
		public final function get LockedMessage():String
		{
			if (IsOpen)
			{
				return "";
			}
			else if (IsCommingSoon)
			{
				return "Coming Soon";
			}
			else
			{
				return "Need level " + OpensOnLevel.LevelNumber;
			}
		}
		public final function get ShowNewMachineStatus():Boolean
		{
			return IsOpen && MachineSession.NewMachine;
		}
		
		// class
		public function CommonLobbyMachineData(id:int, machineName:String, factor:Number, opensOnLevel:LevelData, isComingSoon:Boolean, depreciationRatio:Number)
		{
			super(id);
			
			_machineName = machineName;
			_factor = factor;
			_opensOnLevel = opensOnLevel;
			_isComingSoon = isComingSoon;
			_depreciationRatio = depreciationRatio;
			
			Main.Instance.Session.Machines.AddNewMachineSession(ID);
			MachineSession.addEventListener(CommonMachineSessionDataEvent.NewMachineChanged, OnMachineSessionNewMachineChanged);
			Main.Instance.Session.Wallet.addEventListener(SessionDataEvent.LevelIncreased, OnSessionDataLevelIncreased);
		}
		public override function Dispose():void
		{
			if (_opensOnLevel)
			{
				_opensOnLevel.Dispose();
				_opensOnLevel = null;
			}
			
			Main.Instance.Session.Wallet.removeEventListener(SessionDataEvent.LevelIncreased, OnSessionDataLevelIncreased);
			
			if (MachineSession)
			{
				MachineSession.removeEventListener(CommonMachineSessionDataEvent.NewMachineChanged, OnMachineSessionNewMachineChanged);
			}
			
			super.Dispose();
		}
		
		// events
		protected function OnSessionDataLevelIncreased(event:SessionDataEvent):void
		{
			if (event.WalletSession.GetLevel.LevelNumber >= OpensOnLevel.LevelNumber)
			{
				MachineSession.dispatchEvent(new SlotsMachineSessionDataEvent(CommonMachineSessionDataEvent.NewMachineChanged, MachineSession, 0));
				dispatchEvent(new Event(CommonMachineDataEvent.IsOpenChanged));
				dispatchEvent(new Event(CommonMachineDataEvent.LockedMessageChanged));
			}
		}
		protected function OnMachineSessionNewMachineChanged(event:Event):void
		{
			dispatchEvent(new Event(CommonMachineDataEvent.NewMachineStatusChanged));
		}
	}
}