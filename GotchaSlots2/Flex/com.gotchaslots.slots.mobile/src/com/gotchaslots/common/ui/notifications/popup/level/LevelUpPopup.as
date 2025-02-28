package com.gotchaslots.common.ui.notifications.popup.level
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.spline.SplinesData;
	import com.gotchaslots.common.data.session.level.LevelData;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.ui.notifications.popup.textFields.PopupGroupMessageLeftTextField;
	import com.gotchaslots.common.ui.notifications.popup.textFields.PopupGroupMessageRightTextField;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	public class LevelUpPopup extends BasePopup
	{
		// members
		private var _level:LevelData;
		
		// properties
		protected override function get SizeType():String
		{
			return PopupSizeTypeEnum.BigPopup;
		}
		
		protected override function get Title():String
		{
			return "Congratulations:";
		}
		protected override function get Buttons():Vector.<BaseButton>
		{
			var result:Vector.<BaseButton> = new Vector.<BaseButton>();
			result.push(new MainPopupButton("Collect", OnCollectChipsClick));
			return result;
		}
		
		public override function get ShowSoundKey():String
		{
			return SlotsSoundsManager.Popup_LevelUp_Shown;
		}
		
		// class
		public function LevelUpPopup(level:LevelData, onClose:Function)
		{
			_level = level;
			
			super(onClose);
		}
		protected override function AddBody():void
		{
			AddLevelTextField(0, "You reached level:", _level.LevelNumber.toString());
			AddLevelTextField(1, "Level Up Bonus:", FormatterHelper.NumberToMoney(_level.LevelReachedBonusChips));
			AddLevelTextField(2, "Timer Bonus:", FormatterHelper.NumberToMoney(_level.TimerBonusChips));
			AddLevelTextField(3, "Max Bet:", FormatterHelper.NumberToMoney(_level.MaxBetLevelChips.Chips));
			AddLevelTextField(4.2, "XP for Next Level:", FormatterHelper.NumberToMoney(_level.NextMinXP));
		}
		
		// methods
		private function AddLevelTextField(index:Number, label:String, value:String):void
		{
			var labelTextField:PopupGroupMessageLeftTextField = new PopupGroupMessageLeftTextField(W * 0.9, label);
			labelTextField.x = W * 0.05;
			labelTextField.y = index * 36 + 40;
			addChild(labelTextField);
			
			var valueTextField:PopupGroupMessageRightTextField = new PopupGroupMessageRightTextField(W * 0.9, value);
			valueTextField.x = W * 0.05;
			valueTextField.y = index * 36 + 40;
			addChild(valueTextField);
		}
		
		// money trail
		protected override function DoPostMoneyTrails():void
		{
			Main.Instance.Session.Wallet.CollectLevelUpBonus(_level.LevelReachedBonusChips);
			DoRemove();
		}
		
		// events
		private function OnCollectChipsClick(event:MouseEvent):void
		{
			DoMoneyTrails(new Point(event.stageX - X, event.stageY - Y), new Point(SplinesData.BalancePoint.x - X, SplinesData.BalancePoint.y - Y + 48));
		}
		protected override function OnAutoCloseTimer(event:Event):void
		{
			Main.Instance.Session.Wallet.CollectLevelUpBonus(_level.LevelReachedBonusChips);
			DoRemove();
		}
	}
}