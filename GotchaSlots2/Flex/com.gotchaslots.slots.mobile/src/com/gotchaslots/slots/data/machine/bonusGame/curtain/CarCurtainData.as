package com.gotchaslots.slots.data.machine.bonusGame.curtain
{
	import com.gotchaslots.slots.assets.bonusGame.curtain.car.CarEmbed;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtain.BaseCurtainData;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainItem.MotionCurtainItemData;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainLevel.CurtainLevelData;
	
	import flash.geom.Rectangle;
	
	public class CarCurtainData extends BaseCurtainData
	{
		public override function get StartPopupMessage():String
		{
			return "Car";
		}
		
		// properties
		protected override function get BGClass():Class
		{
			return null;
		}
		
		// class
		public function CarCurtainData() 
		{
			super();
		}
		protected override function InitLevelsAndItems():void
		{
			super.InitLevelsAndItems();
			
			var curtainLevel:CurtainLevelData;
			
			curtainLevel = new CurtainLevelData(_curtainLevels.length, CarEmbed.CarABG, "Car", "Select an Car", 2, true);
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(21, 80, 0, 0), CarEmbed.CarA4, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(157, 219, 0, 0), CarEmbed.CarB2, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(246, 88, 0, 0), CarEmbed.CarB4, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(410, 185, 0, 0), CarEmbed.CarB1, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(582, 123, 0, 0), CarEmbed.CarA3, "", "", ""));
			_curtainLevels.push(curtainLevel);
			
			curtainLevel = new CurtainLevelData(_curtainLevels.length, CarEmbed.CarShopBG, "Car", "Select an CarShop", 1, true);
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(175, 71, 0, 0), CarEmbed.CarShop2, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(55, 247, 0, 0), CarEmbed.CarShop3, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(306, 247, 0, 0), CarEmbed.CarShop4, "", "", ""));
			_curtainLevels.push(curtainLevel);
		}
		protected override function InitMap():void
		{
			_mapRect = new Rectangle(590, 10, 200, 100);
		}
	}
}