package com.gotchaslots.common.ui.notifications.animation
{
	import com.gotchaslots.slots.assets.notifications.animation.AnimationEmbed;
	import com.gotchaslots.common.ui.notifications.animation.base.BaseAnimation;
	
	import flash.display.Bitmap;
	
	public class SampleAnimation extends BaseAnimation
	{
		// properties
		protected override function get X():int
		{
			return 400;
		}
		protected override function get Y():int
		{
			return 365;
		}
		protected override function get SpriteSheet():Bitmap
		{
			return new AnimationEmbed.ColumnFrameRotationAnimation();
		}
		protected override function get Json():String
		{
			return new AnimationEmbed.ColumnFrameRotationAnimationJson();
		}
		
		// class
		public function SampleAnimation(onClose:Function)
		{
			super(onClose);
		}
	}
}