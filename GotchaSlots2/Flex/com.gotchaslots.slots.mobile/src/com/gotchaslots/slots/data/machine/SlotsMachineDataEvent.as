package com.gotchaslots.slots.data.machine
{
	import com.gotchaslots.common.data.machine.CommonMachineDataEvent;

	public class SlotsMachineDataEvent extends CommonMachineDataEvent
	{
		// events
		public static const PendingBonusGameStatusChanged:String = "30e56762da3a45f1978cedb3f39db04e";
		
		public static const ResultMatrixReady:String = "ffdb9f45a05e4dee93dc9834cac94489";
		public static const SelectedPaylinesChanged:String = "3bf9ba03636d4addb116dd0723fc050a";
		public static const SelectedBetChipsChanged:String = "efb93c6ab3ac4ebba6c20615bdb25bfa";
		public static const IsAutoSpinChanged:String = "0742fc6281cc4ba4a5d1d5c8c7b6e84b";
	}
}