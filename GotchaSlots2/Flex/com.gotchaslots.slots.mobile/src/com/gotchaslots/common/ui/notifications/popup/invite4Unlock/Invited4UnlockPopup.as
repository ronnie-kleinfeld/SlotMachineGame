package com.gotchaslots.common.ui.notifications.popup.invite4Unlock
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.Event;
	
	public class Invited4UnlockPopup extends BasePopup
	{
		// members
		private var _newInviteesCount:int;
		private var _lobbyMachine:SlotsBaseLobbyMachineData;
		
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
			result.push(new MainPopupButton("Play", OnPlayClick));
			return result;
		}
		
		// class
		public function Invited4UnlockPopup(lobbyMachine:SlotsBaseLobbyMachineData, newInviteesCount:int)
		{
			super(null);
			
			_lobbyMachine = lobbyMachine;
			_newInviteesCount = newInviteesCount;
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "You have invited");
			AddBlueMessageTextField(W, FormatterHelper.NumberToMoney(_newInviteesCount, 0, 0) + " new friends");
			AddComponent(new Spacer(6));
			AddBlueMessageTextField(W, "The slot machine");
			AddBlueMessageTextField(W, "is unlocked");
		}
		
		// events
		private function OnPlayClick(event:Event):void
		{
			Main.Instance.CreateActiveMachine(_lobbyMachine);
			_lobbyMachine.MachineSession.IsInvite4Unlocked = false;
			_lobbyMachine.MachineSession.NewMachine = false;
			DoRemove();
		}
	}
}