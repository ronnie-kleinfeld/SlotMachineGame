package com.gotchaslots.common.ui.notifications.popup.machine
{
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.ui.notifications.popup.textFields.PopupBlueMessageTextField;
	
	import flash.events.Event;
	
	public class NoChipsBuyChipsPopup extends BasePopup
	{
		// members
		private var _popupBlueMessage:PopupBlueMessageTextField;
		
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}
		
		protected override function get Title():String
		{
			return "No Chips";
		}
		protected override function get Buttons():Vector.<BaseButton>
		{
			var result:Vector.<BaseButton> = new Vector.<BaseButton>();
			result.push(new MainPopupButton("OK", OnBuyChipsClick));
			return result;
		}
		
		// class
		public function NoChipsBuyChipsPopup(onClose:Function)
		{
			super(onClose);
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "You ran out of Chips");
		}
		
		// events
		private function OnCloseClick(event:Event):void
		{
			DoRemove();
		}
		private function OnBuyChipsClick(event:Event):void
		{
			SlotsNotificationsHandler.Instance.ShowBuyChipsPopup(false, null);
			DoRemove();
		}
	}
}