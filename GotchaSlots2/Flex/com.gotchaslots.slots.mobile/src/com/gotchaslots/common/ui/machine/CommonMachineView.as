package com.gotchaslots.common.ui.machine
{
	import com.gotchaslots.common.utils.error.MustOverrideError;
	import com.gotchaslots.common.utils.mvc.BaseMvcController;
	import com.gotchaslots.common.utils.mvc.BaseMvcView;

	public class CommonMachineView extends BaseMvcView
	{
		// class
		public function CommonMachineView(controller:BaseMvcController)
		{
			super(controller);
		}
		
		public override function Init():void
		{
			throw new MustOverrideError();
		}
		
		// methods
		public function Show():void
		{
			throw new MustOverrideError();
		}
		private function OnShowComplete():void
		{
			dispatchEvent(new MachineEvent(MachineEvent.Shown));
		}
		
		public function Hide():void
		{
			throw new MustOverrideError();
		}
		private function OnHideComplete():void
		{
			dispatchEvent(new MachineEvent(MachineEvent.Hidden));
		}
		
		// methods
		public function Enable():void
		{
			throw new MustOverrideError();
		}
		public function Disable():void
		{
			throw new MustOverrideError();
		}
	}
}