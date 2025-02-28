package com.gotchaslots.common.utils.xServices.localNotifications
{
	import com.gotchaslots.common.utils.xServices.BaseCoreMobileHandler;
	import com.milkmangames.nativeextensions.CoreMobile;
	import com.milkmangames.nativeextensions.events.CMLocalNotificationEvent;
	
	public class LocalNotificationsHandler extends BaseCoreMobileHandler
	{
		// class
		public function LocalNotificationsHandler()
		{
			super();
		}
		
		// methods
		public function Register():void
		{
			CoreMobile.mobile.registerForNotifications();
			CoreMobile.mobile.addEventListener(CMLocalNotificationEvent.LOCAL_NOTIFICATION_RECEIVED, OnLocalNotificationReceived);
			CoreMobile.mobile.addEventListener(CMLocalNotificationEvent.RESUMED_FROM_LOCAL_NOTIFICATION, OnResumedFromLocalNotification);
		}
		
		// schedule
		// ScheduleLocalNotification(1, 3600, "Come back!", "Hey, you should come play some more.", "Play now", {coins:50, name:"Bob", type:"OneHour"});
		public function ScheduleLocalNotification(id:int, timeSeconds:Number, title:String, message:String, alertLabel:String = null, extraData:Object = null, badgeNumber:uint = 1, soundName:String = null, bigPictureUri:String = null, largeIconUri:String = null):void
		{
			CoreMobile.mobile.scheduleLocalNotification(id, timeSeconds, title, message, alertLabel, extraData, badgeNumber, soundName, bigPictureUri, largeIconUri);
		}
		// ScheduleRepeatingLocalNotification(1, 3600, 60, "Come back!", "Hey, you should come play some more.", "Play now", {coins:50, name:"Bob", type:"OneHour"});
		public function ScheduleRepeatingLocalNotification(id:int, timeSeconds:Number, thenEverySeconds:Number, title:String, message:String, alertLabel:String = null, extraData:Object = null, badgeNumber:uint = 1, soundName:String = null, bigPictureUri:String = null, largeIconUri:String = null):void
		{
			CoreMobile.mobile.scheduleRepeatingLocalNotification(id, timeSeconds, thenEverySeconds, title, message, alertLabel, extraData, badgeNumber, soundName, bigPictureUri, largeIconUri);
		}
		
		public function Cancel(id:int):void
		{
			CoreMobile.mobile.cancelLocalNotification(id);
		}
		public function CancelAll():void
		{
			CoreMobile.mobile.cancelAllLocalNotifications();
		}
		
		// listener
		private function OnLocalNotificationReceived(event:CMLocalNotificationEvent):void
		{
			dispatchEvent(new LocalNotificationsEvent(LocalNotificationsEvent.LOCAL_NOTIFICATION_RECEIVED, event.title, event.message, event.extra, event.extraJson));
		}
		private function OnResumedFromLocalNotification(event:CMLocalNotificationEvent):void
		{
			dispatchEvent(new LocalNotificationsEvent(LocalNotificationsEvent.RESUMED_FROM_LOCAL_NOTIFICATION, event.title, event.message, event.extra, event.extraJson));
		}
	}
}