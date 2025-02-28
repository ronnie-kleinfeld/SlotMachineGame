package com.gotchaslots.common.data.application.schedulers.scheduler.base
{
	import com.gotchaslots.common.data.application.schedulers.ScheduleData;
	
	public class BaseScheduler
	{
		// members
		private var _from:ScheduleData;
		private var _to:ScheduleData;
		
		// properteis
		public function get From():ScheduleData
		{
			return _from;
		}
		public function get To():ScheduleData
		{
			return _to;
		}
		
		public function get FrameClass():Class
		{
			return null;
		}
		
		// class
		public function BaseScheduler(from:ScheduleData, to:ScheduleData)
		{
			_from = from;
			_to =to;
		}
		public function Dispose():void
		{
			_from = null;
			_to = null;
		}
		
		// methods
		public function IsInRange(current:Date):Boolean
		{
			if (!isNaN(From.FullYear) && (current.fullYear < From.FullYear || current.fullYear > To.FullYear))
			{
				return false;
			}
			if (!isNaN(From.Month) && (current.month + 1 < From.Month || current.month + 1 > To.Month))
			{
				return false;
			}
			if (!isNaN(From.DayOfMonth) && (current.date < From.DayOfMonth || current.date > To.DayOfMonth))
			{
				return false;
			}
			if (!isNaN(From.DayOfWeek) && (current.day + 1 < From.DayOfWeek || current.day + 1 > To.DayOfWeek))
			{
				return false;
			}
			if (!isNaN(From.Hours) && (current.hours < From.Hours || current.hours > To.Hours))
			{
				return false;
			}
			if (!isNaN(From.Minutes) && (current.minutes < From.Minutes || current.minutes > To.Minutes))
			{
				return false;
			}
			
			return true;
		}
	}
}