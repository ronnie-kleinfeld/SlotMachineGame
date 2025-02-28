package com.gotchaslots.common.data.application.schedulers.scheduler
{
	import com.gotchaslots.common.assets.hud.frame.HudFrameEmbed;
	import com.gotchaslots.common.data.application.schedulers.ScheduleData;
	import com.gotchaslots.common.data.application.schedulers.scheduler.base.BaseScheduler;

	public class ColumbusDayScheduler extends BaseScheduler
	{
		// properties
		public override function get FrameClass():Class
		{
			return HudFrameEmbed.ColumbusDay;
		}
		
		// class
		public function ColumbusDayScheduler()
		{
			super(new ScheduleData(Number.NaN, 10, 14), new ScheduleData(Number.NaN, 10, 14));
		}
	}
}