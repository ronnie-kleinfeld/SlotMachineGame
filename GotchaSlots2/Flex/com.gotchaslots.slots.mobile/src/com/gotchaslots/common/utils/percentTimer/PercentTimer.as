package com.gotchaslots.common.utils.percentTimer
{
	import com.gotchaslots.common.utils.ex.EventDispatcherEx;
	import com.gotchaslots.common.utils.ex.TimerEx;
	
	import flash.events.Event;
	import flash.events.TimerEvent;
	
	public class PercentTimer extends EventDispatcherEx
	{
		// members
		private var _percent:Number = 0;
		
		private var _timeForTimerMilliseconds:int;
		private var _timer:TimerEx;
		private var _percentStart:Number;
		private var _percentValue:Number;
		private var _percentTarget:Number;
		private var _percentDiff:Number;
		
		// properties
		public function get Percent():Number
		{
			return _percent;
		}
		public function set Percent(value:Number):void
		{
			_percent = value;
			dispatchEvent(new PercentTimerEvent(PercentTimerEvent.Changed, value));
			
			if (_percent <= 0)
			{
				if (_timer != null)
				{
					_timer.stop();
				}
				_percent = 0;
				dispatchEvent(new PercentTimerEvent(PercentTimerEvent.ZeroReached, value));
			}
			else if (_percent >= 1)
			{
				if (_timer != null)
				{
					_timer.stop();
				}
				_percent = 1;
				dispatchEvent(new PercentTimerEvent(PercentTimerEvent.FullReached, 1));
			}
		}
		
		public function set PercentTo(value:Number):void		
		{
			AnimateTo(value);			
		}
		public function PercentToZero():void		
		{
			AnimateTo(0);			
		}
		public function PercentToFull():void		
		{
			AnimateTo(1);			
		}
		
		// class
		public function PercentTimer(timeForTimerMilliseconds:int = 2500)
		{
			super();
			
			_timeForTimerMilliseconds = timeForTimerMilliseconds;
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			if (_timer)
			{
				_timer.Dispose();
				_timer = null;
			}
		}
		
		// timer
		private function AnimateTo(percent:Number):void
		{
			if (_timer == null)
			{
				_timer = new TimerEx(20, 0);
				_timer.addEventListener(TimerEvent.TIMER, OnTimer);
				_timer.addEventListener(TimerEvent.TIMER_COMPLETE, OnTimerComplete);
			}
			_timer.stop();
			
			_percentStart = Percent;
			_percentValue = Percent;
			_percentTarget = percent;
			
			if (_percentTarget > _percentStart)
			{
				_percentDiff = (_percentTarget - _percentStart) / (_timeForTimerMilliseconds / 20 / 4);
				_timer.start();
			}
			else if (_percentTarget < _percentStart)
			{
				_percentDiff = (_percentTarget - _percentStart) / (_timeForTimerMilliseconds / 20 / 4);
				_timer.start();
			}
		}
		protected function OnTimer(event:Event):void
		{
			if (_percentTarget > _percentStart && _percentValue + _percentDiff > _percentTarget ||
				_percentStart > _percentTarget && _percentValue + _percentDiff < _percentTarget)
			{
				_timer.stop();
				Percent = _percentTarget;
				dispatchEvent(new PercentTimerEvent(PercentTimerEvent.ValueReached, Percent));
			}
			else
			{
				_percentValue = _percentValue + _percentDiff;
				Percent = _percentValue;
			}
		}
		protected function OnTimerComplete(event:Event):void
		{
			Percent = _percentTarget;
			dispatchEvent(new PercentTimerEvent(PercentTimerEvent.ValueReached, Percent));
		}
	}
}