package com.gotchaslots.common.data.application.schedulers
{
	public class ScheduleData
	{
		// members
		private var _fullYear:Number;	// 2000
		private var _month:Number;		// 1 for January, 2 for February, and so on
		private var _dayOfMonth:Number;	// 1 to 31
		private var _dayOfWeek:Number;	// 1 for Sunday, 2 for Monday, and so on
		private var _hours:Number;		// 0 to 23
		private var _minutes:Number;	// 0 to 59
		
		// properties
		public function get FullYear():Number
		{
			return _fullYear;
		}
		public function get Month():Number
		{
			return _month;
		}
		public function get DayOfMonth():Number
		{
			return _dayOfMonth;
		}
		public function get DayOfWeek():Number
		{
			return _dayOfWeek;
		}
		public function get Hours():Number
		{
			return _hours;
		}
		public function get Minutes():Number
		{
			return _minutes;
		}
		
		// class
		public function ScheduleData(fullYear:Number = Number.NaN, month:Number = Number.NaN, dayOfMonth:Number = Number.NaN, dayOfWeek:Number = Number.NaN, hours:Number = Number.NaN, minutes:Number = Number.NaN)
		{
			_fullYear = fullYear;
			_month = month;
			_dayOfMonth = dayOfMonth;
			_dayOfWeek = dayOfWeek;
			_hours = hours;
			_minutes = minutes;
		}
		
		// methods
		public function toString():String
		{
			return Hours + ":" + Minutes + " " + DayOfWeek + " " + DayOfMonth + "/" + Month + "/" + FullYear;
		}
	}
}