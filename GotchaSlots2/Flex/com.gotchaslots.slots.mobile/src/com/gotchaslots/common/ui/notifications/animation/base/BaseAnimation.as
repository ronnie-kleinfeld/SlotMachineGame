package com.gotchaslots.common.ui.notifications.animation.base
{
	import com.gotchaslots.common.ui.notifications.base.BaseNotification;
	import com.gotchaslots.common.utils.animation.AnimationSprite;
	import com.gotchaslots.common.utils.animation.SpriteSheetJson;
	import com.gotchaslots.common.utils.error.MustOverrideError;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class BaseAnimation extends BaseNotification
	{
		// members
		private var	_spriteSheetJson:SpriteSheetJson;
		
		private var _frames:Array;
		private var _animationSprite:AnimationSprite;
		
		// properties
		protected function get SpriteSheet():Bitmap
		{
			throw new MustOverrideError();
		}
		protected function get Json():String
		{
			throw new MustOverrideError();
		}
		protected function get Repeat():Boolean
		{
			return false;
		}
		
		// class
		public function BaseAnimation(onClose:Function)
		{
			super(800, 494, onClose);
			
			x = X;
			y = Y;
			
			_spriteSheetJson = new SpriteSheetJson();
			_spriteSheetJson.Init(SpriteSheet, Json);
			
			_frames = new Array();
			for (var i:int = 0; i < _spriteSheetJson.Length; i++)
			{
				_frames.push(i);
			}
			
			_animationSprite = new AnimationSprite();
			_animationSprite.Init(_spriteSheetJson);
			_animationSprite.addSequence("all", _frames, 16, Repeat);
			_animationSprite.play("all");
			_animationSprite.addEventListener(Event.COMPLETE, OnComplete);
			addChild(_animationSprite);
			
			Start();
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
		
		// events
		private function OnFrameUpdate(event:Event):void
		{
			AnimationSprite(_animationSprite).updateAnimation();
		}
		protected function OnComplete(event:Event):void
		{
			Stop();
			DoRemove();
		}
	}
}