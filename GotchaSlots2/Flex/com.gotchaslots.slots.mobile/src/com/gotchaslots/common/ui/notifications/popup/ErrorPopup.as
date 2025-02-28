package com.gotchaslots.common.ui.notifications.popup
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.slots.utils.consts.SlotsConsts;
	
	import flash.events.Event;
	
	public class ErrorPopup extends BasePopup
	{
		// members
		private var _errorMessage:String;
		
		// properties
		protected override function get Height():int
		{
			return 150;
		}
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}
		
		protected override function get Title():String
		{
			return SlotsConsts.APP_NAME;
		}
		
		protected override function get HasCloseButton():Boolean
		{
			return true;
		}
		
		// class
		public function ErrorPopup(errorMessage:String, onClose:Function)
		{
			Main.Instance.Session.FixSession();
			
			super(onClose);
			
			_errorMessage = errorMessage;
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "We have a problem");
			AddComponent(new Spacer(6));
			AddBlueMessageTextField(W, "Please try again");
			AddBlueMessageTextField(W, "in a few minutes");
		}
		
		// events
		private function OnOKClick(event:Event):void
		{
			if (_errorMessage != null)
			{
				Main.Instance.XServices.GoogleAnalytics.TrackFatalError(_errorMessage);
				Main.Instance.XServices.GoogleAnalytics.ForseDispatch();
			}
		}
	}
}