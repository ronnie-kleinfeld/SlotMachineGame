package com.gotchaslots.slots.data.machine.bonusGame.curtain
{
	import com.gotchaslots.slots.assets.bonusGame.curtain.zoo.ZooEmbed;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtain.BaseCurtainData;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainItem.MotionCurtainItemData;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainLevel.CurtainLevelData;
	
	import flash.geom.Rectangle;
	
	public class ZooCurtainData extends BaseCurtainData
	{
		public override function get StartPopupMessage():String
		{
			return "Zoo";
		}
		
		// properties
		protected override function get BGClass():Class
		{
			return null;
		}
		
		// class
		public function ZooCurtainData()
		{
			super();
		}
		protected override function InitLevelsAndItems():void
		{
			super.InitLevelsAndItems();
			
			var curtainLevel:CurtainLevelData;
			
			curtainLevel = new CurtainLevelData(_curtainLevels.length, ZooEmbed.SeaBG, "Fish", "Choose a Fish", 1, true);
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(427, 282, 117, 148), ZooEmbed.Angelfish_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(362.8, 66, 320, 200), ZooEmbed.Dolphin3_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(616, 282, 100, 66), ZooEmbed.DolphinSwimming_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(247.5, 251.45, 113, 63), ZooEmbed.Dumbfish_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(240, 56, 127, 78), ZooEmbed.Fish2_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(16, 152, 253, 152), ZooEmbed.SharkSwimmingBlack_Motion, "", "", ""));
			_curtainLevels.push(curtainLevel);
			
			curtainLevel = new CurtainLevelData(_curtainLevels.length, ZooEmbed.ChickenBG, "Chicken", "Choose a Chicken", 1, true);
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(67, 160, 128, 131), ZooEmbed.ChickenPlayingGuitar_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(392, 156, 98, 122), ZooEmbed.ChickenScratching_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(442, 332, 129, 54), ZooEmbed.HenWithChicks_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(195, 234, 171, 163), ZooEmbed.RoosterDoingCrazyDance_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(94, 291, 96, 128), ZooEmbed.SingingChicken_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(542, 249, 132, 91), ZooEmbed.SquakingBird_Motion, "", "", ""));
			_curtainLevels.push(curtainLevel);
			
			curtainLevel = new CurtainLevelData(_curtainLevels.length, ZooEmbed.BirdBG, "Bird", "Choose a Bird", 1, true);
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(451, 46, 100, 100), ZooEmbed.BlueFlyingBird_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(216, 244, 110, 110), ZooEmbed.FlyingBird_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(14, 68, 85, 78), ZooEmbed.GreenCartoonBirdFlying_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(354, 174, 122, 70), ZooEmbed.StorkFlyingWithABabyToDeliver_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(659, 193, 88, 95), ZooEmbed.StorkStrugglingToDeliverBabyElephant_Motion, "", "", ""));
			_curtainLevels.push(curtainLevel);
			
			curtainLevel = new CurtainLevelData(_curtainLevels.length, ZooEmbed.DogBG, "Dog", "Choose a Dog", 1, true);
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(28, 269, 145, 72), ZooEmbed.Dalmation_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(589, 233, 107, 123), ZooEmbed.DogEatingDogFood_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(26, 67, 131, 79), ZooEmbed.Doggydig_Appear, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(180, 174, 160, 60), ZooEmbed.GreyDogRunning_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(435, 85, 130, 100), ZooEmbed.PuppyDogRunning_Motion, "", "", ""));
			curtainLevel.CurtainItems.push(new MotionCurtainItemData(curtainLevel.CurtainItems.length, new Rectangle(312, 217, 169, 169), ZooEmbed.PuppyDogSkakingOffWater_Appear, "", "", ""));
			_curtainLevels.push(curtainLevel);
		}
		protected override function InitMap():void
		{
			_mapRect = new Rectangle(590, 10, 200, 100);
		}
	}
}