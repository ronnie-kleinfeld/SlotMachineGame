package com.gotchaslots.common.ui.common.components
{
	import com.gotchaslots.common.ui.common.components.base.BaseComponent;
	import com.gotchaslots.common.utils.animation.AnimationSprite;
	import com.gotchaslots.common.utils.animation.SpriteSheetJson;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class SpriteSheetAnimation extends BaseComponent
	{
		// members
		private var	_spriteSheetJson:SpriteSheetJson;
		
		private var _frames:Array;
		private var _sprites:Array;
		
		// class
		public function SpriteSheetAnimation(spriteSheet:Bitmap, json:String)
		{
			super(null);
			
			_spriteSheetJson = new SpriteSheetJson();
			_spriteSheetJson.Init(spriteSheet, json);
			
			_frames = new Array();
			for (var i:int = 0; i < _spriteSheetJson.Length; i++)
			{
				_frames.push(i);
			}
			
			_sprites = new Array();
			for (i = 0; i < 2; i++)
			{
				var animationSprite:AnimationSprite = CreateAnimation();
				animationSprite.x = i * 80;
				addChild(animationSprite);
				_sprites.push(animationSprite);
				animationSprite.Index = i;
			}
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			addEventListener(Event.ENTER_FRAME, OnFrameUpdate);
		}
		
		// methods
		public function Start():void
		{
			addEventListener(Event.ENTER_FRAME, OnFrameUpdate);
		}
		public function Stop():void
		{
			removeEventListener(Event.ENTER_FRAME, OnFrameUpdate);
		}
		
		private function CreateAnimation():AnimationSprite
		{
			var result:AnimationSprite = new AnimationSprite();
			result.Init(_spriteSheetJson);
			result.addSequence("all", _frames, 16);
			result.play("all");
			return result;
		}
		
		// events
		private function OnFrameUpdate(event:Event):void
		{
			for (var i:int = 0; i < _sprites.length; i++)
			{
				AnimationSprite(_sprites[i]).updateAnimation();
			}
		}
	}
}