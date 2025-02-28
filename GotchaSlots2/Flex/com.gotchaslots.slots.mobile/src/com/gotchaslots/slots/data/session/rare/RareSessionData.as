package com.gotchaslots.slots.data.session.rare
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.MainEvent;
	import com.gotchaslots.common.data.session.SessionDataEvent;
	import com.gotchaslots.common.data.session.base.BaseIOData;
	import com.gotchaslots.common.data.session.base.ISession;
	import com.gotchaslots.common.utils.ex.TimerEx;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	
	public class RareSessionData extends BaseIOData implements ISession
	{
		// consts
		private const KEY:String = "f14c343129984db89330d137c4a4c26b";
		private const MS_IN_ONE_DAY:Number = 1000 * 60 * 60 * 24;
		private const GAP_BETWEEN_TIMER_BONUS:int = 7200000;	//1000 * 60 * 60 * 2 = 2 hours = 7200000 milliseconds
		
		// members
		private var _registrationMS:Number;						// serialize
		private var _recentLoginMS:Number;						// serialize
		
		private var _isWelcomeCollected:Boolean;				// serialize
		private var _isRated:Boolean;							// serialize
		private var _isFacebookLoginCollected:Boolean;			// serialize
		private var _isInviteAsked:Boolean;						// serialize
		private var _invitees:Vector.<String>;					// serialize
		private var _hasSentContacts:Boolean;					// serialize
		
		private var _dailyBonusRecentCollectedIndex:int;		// serialize
		private var _dailyBonusRecentCollectedMS:Number;		// serialize
		
		private var _isTimerBonusActive:Boolean;				// calculated
		private var _timerBonusLastPickMS:Number;				// serialize
		
		private var _recentActiveMachineID:int;					// serialize
		private var _recentPageIndex:int;						// serialize
		
		private var _volume:Boolean;							// serialize
		private var _allowShare:Boolean;						// serialize
		private var _adjustTotalBetOnLowChips:Boolean;			// serialize
		
		private var _registeredOnParse:String;					// serialize
		
		private var _pendingLevelUpPopups:Array;				// serialize
		private var _pendingNewMachinePopups:Array;				// serialize
		
		// properties
		protected override function get Key():String
		{
			return KEY;
		}
		
		public function get RegistrationMS():Number
		{
			return _registrationMS;
		}
		public function set RegistrationMS(value:Number):void
		{
			if (_registrationMS != value)
			{
				if (_registrationMS == 0)
				{
					_registrationMS = value;
					_recentLoginMS = value;
				}
				else
				{
					_recentLoginMS = value;
				}
				
				Save();
			}
		}
		public function get RegistrationAgingDays():int
		{
			if (Main.Instance.XServices.InternetTime.IsInternetTime)
			{
				return (Main.Instance.XServices.InternetTime.CurrentLocalMS - _registrationMS) / 1000 / 60 / 60;
			}
			else
			{
				return 0;
			}
		}
		
		public function get RecentLoginMS():Number
		{
			return _recentLoginMS;
		}
		public function get RecentLoginAgingDays():int
		{
			if (Main.Instance.XServices.InternetTime.IsInternetTime)
			{
				return (Main.Instance.XServices.InternetTime.CurrentLocalMS - _recentLoginMS) / 1000 / 60 / 60;
			}
			else
			{
				return 0;
			}
		}
		
		public function get IsWelcomeCollected():Boolean
		{
			return _isWelcomeCollected;
		}
		public function set IsWelcomeCollected(value:Boolean):void
		{
			if (_isWelcomeCollected != value)
			{
				_isWelcomeCollected = value;
				Save();
			}
		}
		
		public function get IsRated():Boolean
		{
			return _isRated;
		}
		public function set IsRated(value:Boolean):void
		{
			if (_isRated != value)
			{
				_isRated = value;
				Save();
			}
		}
		public function get IsFacebookLoginCollected():Boolean
		{
			return _isFacebookLoginCollected;
		}
		public function set IsFacebookLoginCollected(value:Boolean):void
		{
			if (_isFacebookLoginCollected != value)
			{
				_isFacebookLoginCollected = value;
				Save();
			}
		}
		public function get IsInviteAsked():Boolean
		{
			return _isInviteAsked;
		}
		public function set IsInviteAsked(value:Boolean):void
		{
			if (_isInviteAsked != value)
			{
				_isInviteAsked = value;
				Save();
			}
		}
		public function get Invitees():Vector.<String>
		{
			return _invitees;
		}
		public function set Invitees(value:Vector.<String>):void
		{
			if (_invitees != value)
			{
				_invitees = value;
				Save();
			}
		}
		
		public function get HasSentContacts():Boolean
		{
			return _hasSentContacts;
		}
		public function set HasSentContacts(value:Boolean):void
		{
			if (_hasSentContacts != value)
			{
				_hasSentContacts = value;
				Save();
			}
		}
		
		public function get DailyBonusRecentCollectedIndex():int
		{
			return _dailyBonusRecentCollectedIndex;
		}
		public function set DailyBonusRecentCollectedIndex(value:int):void
		{
			if (value >= 4)
			{
				value = 3;
			}
			_dailyBonusRecentCollectedIndex = value;
		}
		private function get DailyBonusRecentCollectedMS():Number
		{
			return _dailyBonusRecentCollectedMS;
		}
		public function get DailyBonusMSSinceRecetCollection():Number
		{
			return Main.Instance.XServices.InternetTime.CurrentLocalMS - DailyBonusRecentCollectedMS;
		}
		public function get DailyBonusMSLeftToCellect():Number
		{
			return MS_IN_ONE_DAY - DailyBonusMSSinceRecetCollection;
		}
		public function get DailyBonusMSLeftToCellectToString():String
		{
			if (DailyBonusMSLeftToCellect <= 0)
			{
				return "Ready";
			}
			else
			{
				var dt:Date = new Date(0, 0, 0, 0, 0, 0, DailyBonusMSLeftToCellect);
				
				//return FormatterHelper.DateToTime(dt);
				
				if (DailyBonusMSLeftToCellect >= 1000 * 60 * 60)
				{
					return DailyBonusMSLeftToCellectToStringPart(dt.seconds) + ":" + DailyBonusMSLeftToCellectToStringPart(dt.minutes) + ":" + DailyBonusMSLeftToCellectToStringPart(dt.seconds);
				}
				else if (DailyBonusMSLeftToCellect >= 1000 * 60)
				{
					return "00:" + DailyBonusMSLeftToCellectToStringPart(dt.minutes) + ":" + DailyBonusMSLeftToCellectToStringPart(dt.seconds);
				}
				else
				{
					return "00:00:" + DailyBonusMSLeftToCellectToStringPart(dt.seconds);
				}
			}
		}
		private function DailyBonusMSLeftToCellectToStringPart(part:Number):String
		{
			return part < 10 ? "0" + part : part.toString();
		}
		
		public function ValidateDailyBonusCollected():void
		{
			if (DailyBonusMSSinceRecetCollection >= MS_IN_ONE_DAY * 2)
			{
				ResetDailyBonus();
			}
		}
		public function DailyBonusCollected():void
		{
			DailyBonusRecentCollectedIndex++;
			_dailyBonusRecentCollectedMS = Main.Instance.XServices.InternetTime.CurrentLocalMS;
			Main.Instance.Session.Wallet.CollectDailyBonus(DailyBonusRecentCollectedIndex + 1);
			Save();
			
			Main.Instance.XServices.Rate.IncrementEventCount();
		}
		public function ResetDailyBonus():void
		{
			DailyBonusRecentCollectedIndex = -1;
			_dailyBonusRecentCollectedMS = 0;
			Save();
		}
		
		public function get GetIsTimerBonusActive():Boolean
		{
			return _isTimerBonusActive;
		}
		private function get IsTimerBonusActive():Boolean
		{
			return GetIsTimerBonusActive;
		}
		private function set IsTimerBonusActive(value:Boolean):void
		{
			if (_isTimerBonusActive != value)
			{
				_isTimerBonusActive = value;
				
				if (_isTimerBonusActive)
				{
					dispatchEvent(new SessionDataEvent(SessionDataEvent.TimerBonusActivated, null, this, -1));
					Main.Instance.addEventListener(MainEvent.Timer, OnTimerBonusTimer);
				}
				else
				{
					dispatchEvent(new SessionDataEvent(SessionDataEvent.TimerBonusDeactivated, null, this, -1));
					Main.Instance.removeEventListener(MainEvent.Timer, OnTimerBonusTimer);
				}
			}
		}
		
		private function set TimerBonusLastPickMS(value:Number):void
		{
			if (_timerBonusLastPickMS != value)
			{
				_timerBonusLastPickMS = value;
				Save();
			}
		}
		
		public function get IsTimerBonusReady():Boolean
		{
			if (Main.Instance.XServices.InternetTime.IsInternetTime)
			{
				return Main.Instance.XServices.InternetTime.CurrentLocalMS > _timerBonusLastPickMS + GAP_BETWEEN_TIMER_BONUS;
			}
			else
			{
				return false;
			}
		}
		public function get TimerBonusLeft():String
		{
			var diff:Number = Main.Instance.XServices.InternetTime.CurrentLocalMS - _timerBonusLastPickMS; // 123456020 - 123456000
			if (diff > GAP_BETWEEN_TIMER_BONUS)
			{
				// timer bonus is ready
				dispatchEvent(new SessionDataEvent(SessionDataEvent.TimerBonusReady, null, this, -1));
				Main.Instance.Sounds.Play(SlotsSoundsManager.TimerBonus_TimerBonus_Ready);
				return "";
			}
			else if (diff < 0)
			{
				// last pickup is later than now...
				TimerBonusLastPickMS = Main.Instance.XServices.InternetTime.CurrentLocalMS;
				return "";
			}
			else
			{
				var date:Date = new Date(0, 0, 0, 0, 0, 0, GAP_BETWEEN_TIMER_BONUS - diff);
				return FormatterHelper.DateToTime(date);
			}
		}
		
		public function get RecentActiveMachineID():int
		{
			return _recentActiveMachineID;
		}
		public function set RecentActiveMachineID(value:int):void
		{
			if (_recentActiveMachineID != value)
			{
				_recentActiveMachineID = value;
				Save();
			}
		}
		public function get RecentPageIndex():int
		{
			return _recentPageIndex;
		}
		public function set RecentPageIndex(value:int):void
		{
			if (_recentPageIndex != value)
			{
				_recentPageIndex = value;
				Save();
			}
		}
		
		public function get AdjustTotalBetOnLowChips():Boolean
		{
			return _adjustTotalBetOnLowChips;
		}
		public function set AdjustTotalBetOnLowChips(value:Boolean):void
		{
			_adjustTotalBetOnLowChips = value;
		}
		
		public function get Volume():Boolean
		{
			return _volume;
		}
		public function set Volume(value:Boolean):void
		{
			if (_volume != value)
			{
				_volume = value;
				dispatchEvent(new SessionDataEvent(SessionDataEvent.VolumeChanged, null, this, -1));
				Save();
				
				Main.Instance.Application.Ticker.PushMessage(_volume ? "Sound Is On" : "Sound Is Off", "", true);
				if (Main.Instance.Initialized)
				{
					Main.Instance.Sounds.Play(_volume ? SlotsSoundsManager.SoundOn : SlotsSoundsManager.SoundOff);
					
					if (!_volume)
					{
						Main.Instance.Sounds.StopAll();
					}
				}
			}
		}
		public function get AllowShare():Boolean
		{
			return _allowShare;
		}
		public function set AllowShare(value:Boolean):void
		{
			if (_allowShare != value)
			{
				_allowShare = value;
				dispatchEvent(new SessionDataEvent(SessionDataEvent.AllowShareChanged, null, this, -1));
				Save();
			}
		}
		
		public function get RegisteredOnParse():Boolean
		{
			return Main.Instance.Session.Rare.ParseObjectId && Main.Instance.Session.Rare.ParseObjectId != "";
		}
		public function get ParseObjectId():String
		{
			return _registeredOnParse;
		}
		public function set ParseObjectId(value:String):void
		{
			if (_registeredOnParse != value)
			{
				_registeredOnParse = value;
				Save();
			}
		}
		
		public function get PendingLevelUpPopups():Array
		{
			if (!_pendingLevelUpPopups)
			{
				_pendingLevelUpPopups = new Array();
			}
			return _pendingLevelUpPopups;
		}
		public function AddPendingLevelUpPopups(levelNumber:int):void
		{
			_pendingLevelUpPopups.push(levelNumber);
			Save();
		}
		public function PopPendingLevelUpPopups():int
		{
			var result:int = _pendingLevelUpPopups.pop();
			Save();
			return result;
		}
		
		public function get PendingNewMachinePopups():Array
		{
			if (!_pendingNewMachinePopups)
			{
				_pendingNewMachinePopups = new Array();
			}
			return _pendingNewMachinePopups;
		}
		public function AddPendingNewMachinePopups(machineID:int):void
		{
			if (machineID != Main.Instance.Machines[0].ID && Main.Instance.GetLobbyMachineByMachineID(machineID).IsOpen)
			{
				_pendingNewMachinePopups.push(machineID);
				Save();
			}
		}
		public function PopPendingNewMachinePopups():int
		{
			var result:int = _pendingNewMachinePopups.pop();
			Save();
			return result;
		}
		
		// class
		public function RareSessionData()
		{
			super();
			
			_initialized = false;
			
			Init();
			InitTimerBonus();
		}
		protected override function Init():void
		{
			_registrationMS = 0;
			_recentLoginMS = 0;
			IsWelcomeCollected = false;
			IsRated = false;
			HasSentContacts = false;
			ResetDailyBonus();
			TimerBonusLastPickMS = 0;
			RecentActiveMachineID = -1;
			RecentPageIndex = 1;
			Volume = true;
			AllowShare = true;
			ParseObjectId = "";
			_pendingLevelUpPopups = new Array();
			_pendingNewMachinePopups = new Array();
			
			_initialized = true;
		}
		private function InitTimerBonus():void
		{
			IsTimerBonusActive = false;
			
			var timerBonusActivation:TimerEx = new TimerEx(2500);
			timerBonusActivation.addEventListener(TimerEvent.TIMER, onTimerBonusActivationTimer);
			timerBonusActivation.start();
		}
		protected function onTimerBonusActivationTimer(event:Event):void
		{
			if (Main.Instance.XServices.InternetTime.IsInternetTime)
			{
				var timerBonusActivation:TimerEx = TimerEx(event.currentTarget);
				timerBonusActivation.stop();
				timerBonusActivation.removeEventListener(TimerEvent.TIMER, onTimerBonusActivationTimer);
				timerBonusActivation.Dispose();
				timerBonusActivation = null;
				
				IsTimerBonusActive = true;
			}
		}
		public override function Dispose():void
		{
			Main.Instance.removeEventListener(MainEvent.Timer, OnTimerBonusTimer);
			
			while (_invitees && _invitees.length > 0)
			{
				_invitees.pop();
			}
			_invitees = null;
		}
		
		// serialize
		public override function Deserialize(object:Object):void
		{
			_registrationMS = object._registrationMS;
			_recentLoginMS = object._recentLoginMS;
			IsWelcomeCollected = object.IsWelcomeCollected;
			IsRated = object.IsRated;
			IsFacebookLoginCollected = object.IsFacebookLoginCollected;
			IsInviteAsked = object.IsInviteAsked;
			Invitees = object.Invitees;
			HasSentContacts = object.HasSentContacts;
			DailyBonusRecentCollectedIndex = object.DailyBonusRecentCollectedIndex;
			_dailyBonusRecentCollectedMS = object._dailyBonusRecentCollectedMS;
			TimerBonusLastPickMS = object._timerBonusLastPickMS;
			RecentActiveMachineID = object.RecentActiveMachineID;
			RecentPageIndex = object.RecentPageIndex;
			Volume = object.Volume;
			AllowShare = object.AllowShare;
			AdjustTotalBetOnLowChips = object.AdjustTotalBetOnLowChips;
			ParseObjectId = object.ParseObjectId;
			_pendingLevelUpPopups = object.PendingLevelUpPopups;
			_pendingNewMachinePopups = object.PendingNewMachinePopups;
		}
		public override function Serialize():Object
		{
			var result:Object = new Object();
			result.RegistrationMS = RegistrationMS;
			result.RecentLoginMS = RecentLoginMS;
			result.IsWelcomeCollected = IsWelcomeCollected;
			result.IsRated = IsRated;
			result.IsFacebookLoginCollected = IsFacebookLoginCollected;
			result.IsInviteAsked = IsInviteAsked;
			result.Invitees = Invitees;
			result.HasSentContacts = HasSentContacts;
			result.DailyBonusRecentCollectedIndex = DailyBonusRecentCollectedIndex;
			result._dailyBonusRecentCollectedMS = _dailyBonusRecentCollectedMS;
			result._timerBonusLastPickMS = _timerBonusLastPickMS;
			result.RecentActiveMachineID = RecentActiveMachineID;
			result.RecentPageIndex = RecentPageIndex;
			result.Volume = Volume;
			result.AllowShare = AllowShare;
			result.AdjustTotalBetOnLowChips = AdjustTotalBetOnLowChips;
			result.ParseObjectId = ParseObjectId;
			result.PendingLevelUpPopups = PendingLevelUpPopups;
			result.PendingNewMachinePopups = PendingNewMachinePopups;
			return result;
		}
		
		// timer bonus
		protected function onInternetTimeConnected(event:Event):void
		{
			IsTimerBonusActive = Main.Instance.XServices.InternetTime.IsInternetTime;
		}
		protected function OnTimerBonusTimer(event:Event):void
		{
			if (Main.Instance.XServices.InternetTime.CurrentLocalMS > _timerBonusLastPickMS + GAP_BETWEEN_TIMER_BONUS)
			{
				Main.Instance.removeEventListener(MainEvent.Timer, OnTimerBonusTimer);
				dispatchEvent(new SessionDataEvent(SessionDataEvent.TimerBonusReady, null, this, -1));
			}
			else
			{
				dispatchEvent(new SessionDataEvent(SessionDataEvent.TimerBonusChanged, null, this, -1));
			}
		}
		public function CollectTimerBonus():void
		{
			if (IsTimerBonusReady)
			{
				Main.Instance.XServices.GoogleAnalytics.TrackCollectTimerBonus((Main.Instance.XServices.InternetTime.CurrentLocalMS - _timerBonusLastPickMS - GAP_BETWEEN_TIMER_BONUS) / 1000);
				TimerBonusLastPickMS = Main.Instance.XServices.InternetTime.CurrentLocalMS;
				Main.Instance.Session.Wallet.CollectTimerBonus();
				
				Main.Instance.XServices.Rate.IncrementEventCount();
				
				Main.Instance.addEventListener(MainEvent.Timer, OnTimerBonusTimer);
				
				dispatchEvent(new SessionDataEvent(SessionDataEvent.TimerBonusCollected, null, this, -1));
			}
		}
		
		// fix
		public function Fix():void
		{
			_recentActiveMachineID = -1;
			_recentPageIndex = 1;
			Save();
		}
	}
}