package com.gotchaslots.common.ui.notifications.popup.buyChips.buyChipsPopup
{
	import com.gotchaslots.common.assets.notifications.popup.buyChips.BuyChipsEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.application.prices.PriceOptionsData;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buyChips.buyChipsPopup.buyChipsItem.BuyChipsItem;
	import com.gotchaslots.common.ui.notifications.popup.buyChips.buyChipsPopup.buyChipsItem.BuyChipsItemEvent;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	
	public class BuyChipsPopup extends BasePopup
	{
		// memebrs
		private var _priceOptions:PriceOptionsData;
		
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.BigPopup;
		}
		
		protected override function get Title():String
		{
			return _priceOptions.Description;
		}
		
		protected override function get HasCloseButton():Boolean
		{
			return true;
		}
		
		// class
		public function BuyChipsPopup(onlyCurrent:Boolean, onClose:Function)
		{
			_priceOptions = Main.Instance.Application.Prices.GetPriceOptions(onlyCurrent);
			
			super(onClose);
			
			Main.Instance.XServices.GoogleAnalytics.TrackPurchasePopupView();
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventShowBuyChipsPopup();
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "Pick your chips package");
			AddBuyChipsItem(0, new BuyChipsEmbed.PriceBoxABlue());
			AddBuyChipsItem(1, new BuyChipsEmbed.PriceBoxAGreen());
			AddBuyChipsItem(2, new BuyChipsEmbed.PriceBoxAMagenta());
			AddBuyChipsItem(3, new BuyChipsEmbed.PriceBoxAYellow());
		}
		private function AddBuyChipsItem(index:int, normalPng:Bitmap):void
		{
			var buyChipsItem:BuyChipsItem = new BuyChipsItem(_priceOptions, _priceOptions.PriceOptions[index], normalPng);
			buyChipsItem.addEventListener(BuyChipsItemEvent.Clicked, OnBuyChipsItemClicked);
			buyChipsItem.y = 86;
			buyChipsItem.x = 11 + index * (112 + 8);
			
			addChild(buyChipsItem);
		}
		
		// events
		protected function OnBuyChipsItemClicked(event:BuyChipsItemEvent):void
		{
			SlotsNotificationsHandler.Instance.ShowBuyingChipsPopup(event.PriceOptions, null);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventClickBuyChipsPopup(MSSpent);
			DoRemove();
		}
		private function OnCloseClick(event:Event):void
		{
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventCloseBuyChipsPopup(MSSpent);
			DoRemove();
		}
	}
}