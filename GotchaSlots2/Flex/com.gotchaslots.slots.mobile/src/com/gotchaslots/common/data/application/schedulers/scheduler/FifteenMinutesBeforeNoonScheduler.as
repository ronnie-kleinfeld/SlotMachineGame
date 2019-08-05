package com.gotchaslots.common.data.application.schedulers.scheduler
{
	import com.gotchaslots.common.data.application.schedulers.ScheduleData;
	import com.gotchaslots.common.data.application.schedulers.scheduler.base.BaseScheduler;

	public class FifteenMinutesBeforeNoonScheduler extends BaseScheduler
	{
		// class
		public function FifteenMinutesBeforeNoonScheduler()
		{
			super(new ScheduleData(Number.NaN, Number.NaN, Number.NaN, Number.NaN, 11, 45), new ScheduleData(Number.NaN, Number.NaN, Number.NaN, Number.NaN, 11, 59));
		}
	}
}