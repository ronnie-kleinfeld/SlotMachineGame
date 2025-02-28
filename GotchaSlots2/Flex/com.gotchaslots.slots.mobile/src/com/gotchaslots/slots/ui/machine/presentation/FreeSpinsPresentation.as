package com.gotchaslots.slots.ui.machine.presentation
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.spline.SplinesData;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseScatterSymbolData;
	import com.gotchaslots.slots.data.machine.valuator.scatter.FreeSpinsValuatorData;
	import com.gotchaslots.common.ui.common.components.stardust.moneyTrail.MoneyTrail;
	import com.gotchaslots.slots.ui.machine.SlotsMachineView;
	import com.gotchaslots.slots.ui.machine.presentation.base.BaseScatterPresentation;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.Event;
	
	public class FreeSpinsPresentation extends BaseScatterPresentation
	{
		// properties
		protected override function get ValuatorClass():Class
		{
			return FreeSpinsValuatorData;
		}
		protected override function get RemoveByTween():Boolean
		{
			return true;
		}
		protected override function get BlinkSoundKey():String
		{
			return SlotsSoundsManager.Machine_Sequence_FreeSpins_Blink;
		}
		
		// class
		public function FreeSpinsPresentation(onClick:Function, onClose:Function, view:SlotsMachineView)
		{
			super(306, onClick, onClose, view);
		}
		
		// methods
		protected override function DoFlipper2():void
		{
			DoBlinkScatter(0, 3, _valuatorsHandler.FreeSpins.Payboxes, BaseScatterSymbolData(_valuatorsHandler.FreeSpins.Symbol));
		}
		public override function DoPostBlinkScatter():void
		{
			var length:int =  _valuatorsHandler.FreeSpins.Payboxes.length;
			for (var i:int = 0; i < length; i++)
			{
				var freeSpinsValuator:FreeSpinsValuatorData = _valuatorsHandler.FreeSpins;
				var moneyTrail:MoneyTrail = new MoneyTrail(length, freeSpinsValuator.Payboxes[i].Center, null, SplinesData.FreeSpinsRibbonPoint);
				moneyTrail.y += 48;
				if (i == 0)
				{
					moneyTrail.addEventListener(Event.COMPLETE, OnMoneyTrailsComplete);
				}
				addChild(moneyTrail);
				
				if (i == 3)
				{
					break;
				}
			}
			
			Main.Instance.ActiveMachine.LobbyMachine.MachineSession.FreeSpinsCollectCount(_valuatorsHandler.FreeSpins.Payout);
			Main.Instance.XServices.Social.ShareFreeSpins(_valuatorsHandler.FreeSpins.Payout);
			
			Main.Instance.Sounds.Play(SlotsSoundsManager.Machine_Sequence_FreeSpins_SymbolToFreeSpinsRibbon);
		}
		private function OnMoneyTrailsComplete(event:Event):void
		{
			var moneyTrail:MoneyTrail = MoneyTrail(event.currentTarget);
			moneyTrail.removeEventListener(Event.COMPLETE, OnMoneyTrailsComplete);
			DoPostMoneyTrails();
		}
	}
}