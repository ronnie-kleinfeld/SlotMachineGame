package com.gotchaslots.common.ui.notifications.popup.buyChips
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.application.prices.PriceOptionData;
	import com.gotchaslots.common.data.application.prices.ProductID;
	import com.gotchaslots.common.ui.common.components.AndroidLoader;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.utils.xServices.inAppPurchase.base.InAppPurchaseHandlerEvent;
	
	import flash.events.Event;
	
	public class BuyingChipsPopup extends BasePopup
	{
		// members
		private var _priceOption:PriceOptionData;
		
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.SmallPopup;
		}
		
		protected override function get Title():String
		{
			return "Buy Chips";
		}
		
		protected override function get AutoCloseTimeout():int
		{
			return 60000; 
		}
		
		protected override function get HasCloseButton():Boolean
		{
			return true;
		}
		
		// class
		public function BuyingChipsPopup(priceOption:PriceOptionData, onClose:Function)
		{
			super(onClose);
			
			_priceOption = priceOption;
			
			Main.Instance.XServices.InAppPurchase.addEventListener(InAppPurchaseHandlerEvent.PurchaseSuccessed, OnPurchaseSuccessed);
			Main.Instance.XServices.InAppPurchase.addEventListener(InAppPurchaseHandlerEvent.PurchaseCanceled, OnPurchaseCanceled);
			Main.Instance.XServices.InAppPurchase.addEventListener(InAppPurchaseHandlerEvent.Failed, OnFailed);
			Main.Instance.XServices.InAppPurchase.Purchase(_priceOption.ProductID);
			
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventShowBuyingChipsPopup();
		}
		public override function Dispose():void
		{
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseSuccessed, OnPurchaseSuccessed);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseCanceled, OnPurchaseCanceled);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.Failed, OnFailed);
			
			super.Dispose();
		}
		
		protected override function AddBody():void
		{
			AddComponent(new Spacer(6));
			AddBlueMessageTextField(W, "Connecting");
			AddComponent(new Spacer(6));
			var androidLoader:AndroidLoader = new AndroidLoader(100, 100);
			androidLoader.x = (W - androidLoader.width) / 2;
			AddComponent(androidLoader);
		}
		
		// events
		protected function OnPurchaseSuccessed(event:InAppPurchaseHandlerEvent):void
		{
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseSuccessed, OnPurchaseSuccessed);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseCanceled, OnPurchaseCanceled);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.Failed, OnFailed);
			
			SlotsNotificationsHandler.Instance.ShowChipsBoughtPopup(_priceOption, null);
			Main.Instance.XServices.Parse.PurchaseComplete(_priceOption.ProductID, _priceOption.Chips);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseTransaction(ProductID.DescriptionByProductID(_priceOption.ProductID), ProductID.PriceByProductID(_priceOption.ProductID), _priceOption.Chips, _priceOption.ProductID, _priceOption.Description);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventSuccessBuyingChipsPopup(MSSpent);
			DoRemove();
		}
		protected function OnPurchaseCanceled(event:Event):void
		{
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseSuccessed, OnPurchaseSuccessed);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseCanceled, OnPurchaseCanceled);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.Failed, OnFailed);
			
			SlotsNotificationsHandler.Instance.ShowNoChargePopup(null);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventFailedBuyingChipsPopup(MSSpent);
			DoRemove();
		}
		protected function OnFailed(event:Event):void
		{
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseSuccessed, OnPurchaseSuccessed);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.PurchaseCanceled, OnPurchaseCanceled);
			Main.Instance.XServices.InAppPurchase.removeEventListener(InAppPurchaseHandlerEvent.Failed, OnFailed);
			
			SlotsNotificationsHandler.Instance.ShowNoChargePopup(null);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventCancelBuyingChipsPopup(MSSpent);
			DoRemove();
		}
		private function OnCancelClick(event:Event):void
		{
			SlotsNotificationsHandler.Instance.ShowNoChargePopup(null);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventCancelBuyingChipsPopup(MSSpent);
			DoRemove();
		}
	}
}