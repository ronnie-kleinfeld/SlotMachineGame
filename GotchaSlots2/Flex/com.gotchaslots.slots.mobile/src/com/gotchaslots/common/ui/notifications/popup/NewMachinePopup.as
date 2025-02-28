package com.gotchaslots.common.ui.notifications.popup
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.common.ui.common.components.Spacer;
	import com.gotchaslots.common.ui.common.components.base.BaseButton;
	import com.gotchaslots.slots.ui.machine.Symbol;
	import com.gotchaslots.common.ui.notifications.popup.base.BasePopup;
	import com.gotchaslots.common.ui.notifications.popup.base.PopupSizeTypeEnum;
	import com.gotchaslots.common.ui.notifications.popup.buttons.MainPopupButton;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.Event;
	import flash.geom.Rectangle;
	
	public class NewMachinePopup extends BasePopup
	{
		// members
		private var _lobbyMachine:SlotsBaseLobbyMachineData;
		
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
			result.push(new MainPopupButton("Play", OnPlayMachineClick));
			return result;
		}
		
		protected override function get HasCloseButton():Boolean
		{
			return true;
		}
		
		public override function get ShowSoundKey():String
		{
			return SlotsSoundsManager.Popup_NewMachine_Shown;
		}
		
		// class
		public function NewMachinePopup(lobbyMachine:SlotsBaseLobbyMachineData, onClose:Function)
		{
			_lobbyMachine = lobbyMachine;
			
			super(onClose);
		}
		protected override function AddBody():void
		{
			AddBlueMessageTextField(W, "You've opened a new machine");
			AddComponent(new Spacer(115));
			AddBlueMessageTextField(W, "Click Play to start playing the new Slots Machine");
			
			var symbol:Symbol = _lobbyMachine.Symbols.PreviewSymbol.GetSymbol(new Rectangle(0, 0, 100, 100));
			symbol.x = (W - symbol.width) / 2;
			symbol.y = 95;
			symbol.width = symbol.height = 100;
			addChild(symbol);
		}
		
		// events
		private function OnBackToGameClick(event:Event):void
		{
			Main.Instance.XServices.Rate.IncrementEventCount();
			DoRemove();
		}
		private function OnPlayMachineClick(event:Event):void
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			Main.Instance.RemoveActiveMachine();
		}
		protected function onEnterFrame(event:Event):void
		{
			if (!Main.Instance.ActiveMachine)
			{
				removeEventListener(Event.ENTER_FRAME, onEnterFrame);
				
				Main.Instance.CreateActiveMachine(_lobbyMachine);
				Main.Instance.XServices.Rate.IncrementEventCount();
				DoRemove();
			}
		}
	}
}