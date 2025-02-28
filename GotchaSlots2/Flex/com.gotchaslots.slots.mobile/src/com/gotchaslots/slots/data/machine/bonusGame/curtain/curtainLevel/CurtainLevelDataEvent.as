package com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainLevel
{
	import flash.events.Event;
	
	public class CurtainLevelDataEvent extends Event
	{
		// events
		public static const CurrentLevelChanged:String = "7d231e5ac581450dbd345511162f80b8";
		public static const LevelClicked:String = "80b6a53762b9455a8a1f904d851c473b";
		public static const LevelSuccess:String = "bc77518e7f4b4c76ad25b0b7d59c3b36";
		public static const LevelFailed:String = "022524a9fb424bf7b8ebdc8910b765fe";
		
		// members
		private var _curtainLevel:CurtainLevelData;
		
		// properties
		public function get CurtainLevel():CurtainLevelData
		{
			return _curtainLevel;
		}
		
		// class
		public function CurtainLevelDataEvent(type:String, curtainLevel:CurtainLevelData)
		{
			super(type);
			
			_curtainLevel = curtainLevel;
		}
	}
}