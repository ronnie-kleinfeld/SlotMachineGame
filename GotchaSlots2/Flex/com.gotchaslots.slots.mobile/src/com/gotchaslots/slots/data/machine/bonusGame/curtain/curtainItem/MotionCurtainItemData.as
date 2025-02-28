package com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainItem
{
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainItem.base.BaseCurtainItemData;
	import com.gotchaslots.slots.ui.machine.bonusGameEngine.curtain.item.MotionItemBox;
	
	import flash.geom.Rectangle;
	
	public class MotionCurtainItemData extends BaseCurtainItemData
	{
		// properties
		public override function get ItemBoxClass():Class
		{
			return MotionItemBox;
		}
		
		// class
		public function MotionCurtainItemData(id:int, rectFrom:Rectangle, mcClass:Class, clickSound:String, winSound:String, loseSound:String)
		{
			super(id, rectFrom, mcClass, clickSound, winSound, loseSound);
		}
	}
}