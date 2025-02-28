package com.gotchaslots.common.ui.notifications.popup.buyChips.buyChipsPopup.buyChipsItem
{
	import com.gotchaslots.common.data.application.prices.PriceOptionData;
	
	import flash.events.Event;
	
	public class BuyChipsItemEvent extends Event
	{
		// events
		public static const Clicked:String = "8d79fc43dca04adcaa39f610ade94a43";
		
		// memebrs
		private var _priceOption:PriceOptionData;
		
		// properties
		public function get PriceOptions():PriceOptionData
		{
			return _priceOption;
		}
		
		// class
		public function BuyChipsItemEvent(type:String, priceOption:PriceOptionData)
		{
			super(type);
			
			_priceOption = priceOption;
		}
	}
}