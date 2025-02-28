package com.gotchaslots.common.data.session
{
	import com.gotchaslots.slots.data.session.rare.RareSessionData;
	import com.gotchaslots.slots.data.session.wallet.WalletSessionData;
	
	import flash.events.Event;
	
	public class SessionDataEvent extends Event
	{
		// events
		public static const JackpotChanged:String = "12f03d46ab644e1db8c75a8e478b29cc";
		public static const JackpotWon:String = "79b8fb2762294563ae66d5bae51cbf24";
		
		public static const BalanceChanged:String = "4a4fd01298c94aab8802744e939dc480";
		public static const BalanceIncreased:String = "c477718256e54c93b03befce9e2190c6";
		
		public static const XPChanged:String = "e667400ae5bf476688d0391df4a04e1c";
		
		public static const LevelIncreased:String = "647fcc742dec48e6b0d5f58958ebc67f";
		
		public static const VolumeChanged:String = "138c4d1295734eb9a842a2cc8f399c80";
		public static const AllowShareChanged:String = "baef27663ca74f29b33c3c9ef6837aea";
		
		public static const TimerBonusActivated:String = "73849e5ece2049f1b7c0dd9bdac5ea7c";
		public static const TimerBonusDeactivated:String = "759ae7c3470e465d9d6a4fe6e916da6a";
		public static const TimerBonusChanged:String = "d8a9f59617674107974ff06fd3d024d5";
		public static const TimerBonusReady:String = "2dff93e0e948442f88bc1496fa26d243";
		public static const TimerBonusCollected:String = "90acde5cbaa44c2d89a4b4b285fad2ce";

		public static const LocaleChanged:String = "593ccc01c3c24d559c36d462bdef8718";

		// members
		private var _walletSession:WalletSessionData;
		private var _rareSession:RareSessionData;
		private var _value:Number;
		
		// properties
		public function get WalletSession():WalletSessionData
		{
			return _walletSession;
		}
		public function get RareSession():RareSessionData
		{
			return _rareSession;
		}
		public function get Value():Number
		{
			return _value;
		}
		
		// class
		public function SessionDataEvent(type:String, walletSession:WalletSessionData, rareSession:RareSessionData, value:Number)
		{
			super(type, false, false);
			
			_walletSession = walletSession;
			_rareSession = rareSession;
			_value = value;
		}
	}
}