package com.gotchaslots.common.utils.xServices.ads
{
	import com.gotchaslots.common.utils.xServices.ads.base.BaseAdsHandler;
	import com.gotchaslots.slots.utils.consts.SlotsConsts;
	import com.milkmangames.nativeextensions.AdMob;
	import com.milkmangames.nativeextensions.AdMobAdType;
	import com.milkmangames.nativeextensions.AdMobAlignment;
	import com.milkmangames.nativeextensions.events.AdMobErrorEvent;
	import com.milkmangames.nativeextensions.events.AdMobEvent;
	
	public class AdMobHandler extends BaseAdsHandler
	{
		// members
		private var _autoShowAd:Boolean;
		
		// class
		public function AdMobHandler()
		{
			super();
			
			Init();
		}
		protected override function Init():Boolean
		{
			if (!_initialized)
			{
				if(AdMob.isSupported)
				{
					AdMob.init(SlotsConsts.AD_MOB_BANNER_ANDROID, SlotsConsts.AD_MOB_BANNER_IOS);
					AdMob.addEventListener(AdMobEvent.LEAVE_APPLICATION, OnLeaveApplication);
					AdMob.addEventListener(AdMobEvent.RECEIVED_AD, OnReceiveAd);
					AdMob.addEventListener(AdMobEvent.SCREEN_DISMISSED, OnScreenDismissed);
					AdMob.addEventListener(AdMobEvent.SCREEN_PRESENTED, OnScreenPresented);
					AdMob.addEventListener(AdMobErrorEvent.FAILED_TO_RECEIVE_AD, OnFailedToReceiveAd);
					
					_initialized = true;
					
					CONFIG::DEBUG
						{
							// remove this line when you're done testing!
							//AdMob.enableTestDeviceIDs(AdMob.getCurrentTestDeviceIDs());
						}
						
						AdMob.enableTestDeviceIDs(AdMob.getCurrentTestDeviceIDs());
				}
				else
				{
					_initialized = false;
				}
			}
			
			return _initialized;
		}
		
		// banner
		public override function ShowBanner():void
		{
			if (Init())
			{
				AdMob.showAd(AdMobAdType.SMART_BANNER, AdMobAlignment.CENTER, AdMobAlignment.TOP);
			}
		}
		public override function RemoveBanner():void
		{
			if (Init())
			{
				AdMob.destroyAd();
			}
		}
		
		// interstitial
		public override function LoadInterstitial():void
		{
			if (Init())
			{
				_autoShowAd = false;
				AdMob.loadInterstitial(SlotsConsts.AD_MOB_INTERSTITIAL_ANDROID, false, SlotsConsts.AD_MOB_INTERSTITIAL_IOS);
			}
		}
		public override function ShowInterstitial():void
		{
			if (Init())
			{
				_autoShowAd = true;
				
				if (AdMob.isInterstitialReady())
				{
					AdMob.showPendingInterstitial();
				}
				else
				{
					AdMob.loadInterstitial(SlotsConsts.AD_MOB_INTERSTITIAL_ANDROID, true, SlotsConsts.AD_MOB_INTERSTITIAL_IOS);
				}
			}
		}
		public override function RemoveInterstitial():void
		{
			if (Init())
			{
				AdMob.destroyAd();
			}
		}
		
		// events
		private function OnReceiveAd(event:AdMobEvent):void
		{
			trace("ad has loaded!");
		}
		private function OnLeaveApplication(event:AdMobEvent):void
		{
			trace("ad took user out of app.");
		}
		private function OnScreenDismissed(event:AdMobEvent):void
		{
			trace("modal closed. You might want to resume the game here if paused.");
		}
		private function OnScreenPresented(event:AdMobEvent):void
		{
			trace("modal is showing...you might want to pause or stop sound here.");
		}
		private function OnFailedToReceiveAd(event:AdMobErrorEvent):void
		{
			trace("Some problem");
		}
	}
}