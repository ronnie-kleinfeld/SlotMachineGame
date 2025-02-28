package com.gotchaslots.common.utils.debug
{
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	
	import flash.events.Event;
	import flash.utils.getTimer;
	
	public class FrameRateHandler extends SpriteEx
	{
		// consts
		public static const MAX_RATE_FOR_ANIMATION:int = 24;
		
		// members
		private var _fps:int;
		private var _fpss:Vector.<Number>;
		private var _lastTimeCheck:uint;
		private var _actualFrameRate:Number;
		
		// properties
		public function get ActualFrameRate():Number
		{
			return Math.round(_actualFrameRate / _fpss.length);
		}
		
		// class
		public function FrameRateHandler()
		{
			super();
			
			_lastTimeCheck = getTimer();
			_fpss = new Vector.<Number>();
			_actualFrameRate = 0;
			
			addEventListener(Event.ENTER_FRAME, OnFrameRate);
		}
		
		// events
		protected function OnFrameRate(event:Event):void
		{
			var timer:int = getTimer();
			
			if (timer - 1000 > _lastTimeCheck)
			{
				var vectorLength:int = _fpss.push(_fps);
				if (vectorLength > 60)
				{
					_fpss.shift();
				}
				
				_actualFrameRate = 0;
				for (var i:Number = 0; i < _fpss.length; i++)
				{
					_actualFrameRate += _fpss[i];
				}
				
				_fps = 0;
				_lastTimeCheck = timer;
			}
			
			_fps++;
		}
	}
}