package com.gotchaslots.common.data.application.schedulers.scheduler
{
	import com.gotchaslots.common.assets.hud.frame.HudFrameEmbed;
	import com.gotchaslots.common.data.application.schedulers.ScheduleData;
	import com.gotchaslots.common.data.application.schedulers.scheduler.base.BaseScheduler;

	public class FirstDayOfAutumn extends BaseScheduler
	{
		// properties
		public override function get FrameClass():Class
		{
			return HudFrameEmbed.FirstDayOfAutumn;
		}
		
		// class
		public function FirstDayOfAutumn()
		{
			super(new ScheduleData(Number.NaN, 9, 22), new ScheduleData(Number.NaN, 9, 2));
		}
	}
}