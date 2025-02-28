package com.gotchaslots.common.ui.notifications.popup.buyChips
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.application.prices.PriceOptionData;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class ChipsBoughtPopup extends BasePopup
	{
		// members
		private var _priceOption:PriceOptionData;
		
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}
		
		protected override function get Title():String
		{
			return "Chips Bought";
		}
		protected override function get Buttons():Vector.<BaseButton>
		{
			var result:Vector.<BaseButton> = new Vector.<BaseButton>();
			result.push(new MainPopupButton("Collect", OnCollectClick));
			return result;
		}
		
		// class
		public function ChipsBoughtPopup(priceOption:PriceOptionData, onClose:Function)
		{
			_priceOption = priceOption;
			
			super(onClose);
			
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventShowChipsBoughtPopup();
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "Purchase Complete");
			AddComponent(new Spacer(16));
			AddBlueMessageTextField(W, "Chips: " + FormatterHelper.NumberToMoney(_priceOption.Chips));
		}
		
		// events
		private function OnCollectClick(event:MouseEvent):void
		{
			Main.Instance.Session.Wallet.CollectChipsBought(_priceOption.Chips);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventCollectChipsBoughtPopup(MSSpent);
			DoRemove();
		}
		protected override function OnAutoCloseTimer(event:Event):void
		{
			Main.Instance.Session.Wallet.CollectChipsBought(_priceOption.Chips);
			Main.Instance.XServices.GoogleAnalytics.TrackPurchaseEventCollectChipsBoughtPopup(MSSpent);
			DoRemove();
		}
	}
}