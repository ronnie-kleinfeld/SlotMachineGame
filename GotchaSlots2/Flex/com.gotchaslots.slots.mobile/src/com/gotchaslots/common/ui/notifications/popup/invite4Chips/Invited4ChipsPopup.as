package com.gotchaslots.common.ui.notifications.popup.invite4Chips
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.spline.SplinesData;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class Invited4ChipsPopup extends BasePopup
	{
		// members
		private var _newInviteesCount:int;
		
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.MediumPopup;
		}
		
		protected override function get Title():String
		{
			return "Invitation Sent!";
		}
		protected override function get Buttons():Vector.<BaseButton>
		{
			var result:Vector.<BaseButton> = new Vector.<BaseButton>();
			result.push(new MainPopupButton("Collect", OnCollectClick));
			return result;
		}
		
		// class
		public function Invited4ChipsPopup(newInviteesCount:int)
		{
			super(null);
			
			_newInviteesCount = newInviteesCount;
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "You have invited");
			AddBlueMessageTextField(W, FormatterHelper.NumberToMoney(_newInviteesCount, 0, 0) + " new friends");
			AddComponent(new Spacer(16));
			AddBlueMessageTextField(W, "Collect");
			AddBlueMessageTextField(W, FormatterHelper.NumberToMoney(Main.Instance.Session.Wallet.GetLevel.LevelReachedBonusChips / 10 * _newInviteesCount, 0) + " Chips");
		}
		
		// money trail
		protected override function DoPostMoneyTrails():void
		{
			Main.Instance.Session.Wallet.CollectInvited4Chips(_newInviteesCount);
			DoRemove();
		}
		
		// events
		private function OnCollectClick(event:MouseEvent):void
		{
			DoMoneyTrails(new Point(event.stageX - X, event.stageY - Y), new Point(SplinesData.BalancePoint.x - X, SplinesData.BalancePoint.y - Y + 48));
		}
	}
}