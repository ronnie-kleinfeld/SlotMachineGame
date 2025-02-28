package com.gotchaslots.common.data.application.schedulers.scheduler
{
	import com.gotchaslots.common.assets.hud.frame.HudFrameEmbed;
	import com.gotchaslots.common.data.application.schedulers.ScheduleData;
	import com.gotchaslots.common.data.application.schedulers.scheduler.base.BaseScheduler;
	
	public class EasterScheduler extends BaseScheduler
	{
		// properties
		public override function get FrameClass():Class
		{
			return HudFrameEmbed.Easter;
		}
		
		// class
		public function EasterScheduler()
		{
			super(new ScheduleData(Number.NaN, 3, 21), new ScheduleData(Number.NaN, 3, 24));
		}
	}
}