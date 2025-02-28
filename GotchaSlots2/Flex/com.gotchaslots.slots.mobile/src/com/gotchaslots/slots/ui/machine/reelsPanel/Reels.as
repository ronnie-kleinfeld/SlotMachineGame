package com.gotchaslots.slots.ui.machine.reelsPanel
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	
	import flash.events.Event;
	
	public class Reels extends SpriteEx
	{
		// class
		public function Reels()
		{
			super();
			
			for (var i:int = 0; i < Main.Instance.ActiveMachine.LobbyMachine.Paylines.Paylines[0].ColumnsCount; i++)
			{
				var reel:Reel = new Reel(i);
				reel.addEventListener(ReelsPanelEvent.ReelStopped, OnReelStopped);
				addChild(reel);
			}
		}
		public override function Dispose():void
		{
			while (numChildren > 0)
			{
				var reel:Reel = Reel(removeChildAt(0));
				reel.removeEventListener(ReelsPanelEvent.ReelStopped, OnReelStopped);
				reel.Dispose();
				reel = null;
			}
			
			super.Dispose();
		}
		
		// methods
		public function Start():void
		{
			for (var i:int = 0; i < numChildren; i++)
			{
				var reel:Reel = Reel(getChildAt(i));
				reel.Start();
			}
		}
		public function GetReel(column:int):Reel
		{
			return Reel(getChildAt(column));
		}
		
		// events
		private function OnReelStopped(event:Event):void
		{
			dispatchEvent(new Event(ReelsPanelEvent.ReelStopped));
		}
	}
}