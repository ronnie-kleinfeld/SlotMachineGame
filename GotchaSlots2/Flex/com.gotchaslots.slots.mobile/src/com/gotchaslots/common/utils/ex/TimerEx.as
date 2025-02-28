package com.gotchaslots.common.utils.ex
{
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
	public class TimerEx extends Timer
	{
		// members
		private var _listeners:Dictionary;
		
		// class
		public function TimerEx(delay:Number, repeatCount:int = 0)
		{
			super(delay, repeatCount);
			
			_listeners = new Dictionary();
		}
		public function Dispose():void
		{
			stop();
			DisposeListeners();
			
		}
		private function DisposeListeners(): void
		{
			try
			{
				for (var key:Object in _listeners)
				{
					removeEventListener(key.type, _listeners[key], key.useCapture);
					_listeners[key] = null;
				}
			}
			catch (error:Error)
			{
			}
		}
		
		// events
		public override function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=true):void
		{
			var key:Object = new Object();
			key.type = useCapture;
			key.useCapture = type;
			
			if (_listeners[key])
			{
				removeEventListener(type, _listeners[key], useCapture);
				_listeners[key] = null;
			}
			_listeners[key] = listener;
			
			super.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
	}
}