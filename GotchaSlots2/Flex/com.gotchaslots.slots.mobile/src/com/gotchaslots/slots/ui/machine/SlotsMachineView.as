package com.gotchaslots.slots.ui.machine
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.machine.CommonMachineView;
	import com.gotchaslots.common.ui.machine.MachineEvent;
	import com.gotchaslots.common.utils.mvc.BaseMvcController;
	import com.gotchaslots.slots.ui.machine.bottomPanel.BottomPanel;
	import com.gotchaslots.slots.ui.machine.bottomPanel.BottomPanelEvent;
	import com.gotchaslots.slots.ui.machine.freeSpins.FreeSpinsRibbon;
	import com.gotchaslots.slots.ui.machine.presentation.base.PresentationBox;
	import com.gotchaslots.slots.ui.machine.reelsPanel.ReelsPanel;
	import com.gotchaslots.slots.ui.machine.reelsPanel.ReelsPanelEvent;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	import com.greensock.easing.Sine;
	
	import flash.events.Event;
	
	public class SlotsMachineView extends CommonMachineView
	{
		// members
		private var _reelsPanel:ReelsPanel;
		private var _bottomPanel:BottomPanel;
		private var _freeSpinsRibbon:FreeSpinsRibbon;
		private var _presentationBox:PresentationBox;
		
		// properties
		public function get GetReelsPanel():ReelsPanel
		{
			return _reelsPanel;
		}
		public function get GetBottomPanel():BottomPanel
		{
			return _bottomPanel;
		}
		public function get GetPresentationBox():PresentationBox
		{
			return _presentationBox;
		}
		
		// class
		public function SlotsMachineView(controller:BaseMvcController)
		{
			super(controller);
		}
		
		public override function Init():void
		{
			InitReelsPanel();
			InitBottomPanel();
			InitFreeSpinsRibbon();
			InitPresentationBox();
		}
		private function InitReelsPanel():void
		{
			_reelsPanel = new ReelsPanel();
			_reelsPanel.addEventListener(ReelsPanelEvent.ReelStopped, OnReelStopped);
			_reelsPanel.Init();
			_reelsPanel.y = -Main.Instance.Device.DesignRectangle.height;
			addChild(_reelsPanel);
		}
		private function InitBottomPanel():void
		{
			_bottomPanel = new BottomPanel();
			_bottomPanel.addEventListener(BottomPanelEvent.AutoSpinButtonClicked, OnAutoSpinButtonClicked);
			_bottomPanel.addEventListener(BottomPanelEvent.MaxBetButtonClicked, OnMaxBetButtonClicked);
			_bottomPanel.addEventListener(BottomPanelEvent.SpinButtonClicked, OnSpinButtonClicked);
			_bottomPanel.y = Main.Instance.Device.DesignRectangle.height;
			addChild(_bottomPanel);
		}
		private function InitFreeSpinsRibbon():void
		{
			_freeSpinsRibbon = new FreeSpinsRibbon();
			_freeSpinsRibbon.x = -270;
			_freeSpinsRibbon.y = 362;
			addChild(_freeSpinsRibbon);
		}
		private function InitPresentationBox():void
		{
			_presentationBox = new PresentationBox();
			addChild(_presentationBox);
		}
		public override function Dispose():void
		{
			if (_freeSpinsRibbon)
			{
				TweenLite.killTweensOf(_freeSpinsRibbon);	
			}
			
			if (_bottomPanel)
			{
				TweenLite.killTweensOf(_bottomPanel);
				_bottomPanel.removeEventListener(BottomPanelEvent.AutoSpinButtonClicked, OnAutoSpinButtonClicked);
				_bottomPanel.removeEventListener(BottomPanelEvent.MaxBetButtonClicked, OnMaxBetButtonClicked);
				_bottomPanel.removeEventListener(BottomPanelEvent.SpinButtonClicked, OnSpinButtonClicked);
			}
			
			if (_reelsPanel)
			{
				TweenLite.killTweensOf(_reelsPanel);
				_reelsPanel.removeEventListener(ReelsPanelEvent.ReelStopped, OnReelStopped);
			}
			
			super.Dispose();
		}
		
		// methods
		public override function Show():void
		{
			TweenLite.to(_reelsPanel, 0.5, {y:48, ease:Sine.easeOut});
			TweenLite.to(_bottomPanel, 0.3, {y:48 + 306, delay:0.2, ease:Sine.easeOut, onComplete:OnShowComplete});
		}
		private function OnShowComplete():void
		{
			dispatchEvent(new MachineEvent(MachineEvent.Shown));
		}
		
		public override function Hide():void
		{
			TweenLite.to(_reelsPanel, 0.5, {y:-Main.Instance.Device.DesignRectangle.height, ease:Cubic.easeIn});
			TweenLite.to(_bottomPanel, 0.5, {y:Main.Instance.Device.DesignRectangle.height, ease:Cubic.easeIn, onComplete:OnHideComplete});
			TweenLite.to(_freeSpinsRibbon, 0.5, {x:-270, ease:Cubic.easeIn});
			TweenLite.to(_presentationBox, 0.1, {alpha:0});
		}
		private function OnHideComplete():void
		{
			dispatchEvent(new MachineEvent(MachineEvent.Hidden));
		}
		
		// methods
		public override function Enable():void
		{
			_bottomPanel.Enable();
		}
		public override function Disable():void
		{
			_bottomPanel.Disable();
		}
		
		// events
		protected function OnReelStopped(event:Event):void
		{
			SlotsMachineController(Controller).ReelStopped();
		}
		
		protected function OnAutoSpinButtonClicked(event:Event):void
		{
			SlotsMachineController(Controller).DoAutoSpin(false);
		}
		protected function OnMaxBetButtonClicked(event:Event):void
		{
			SlotsMachineController(Controller).MaxBet();
		}
		protected function OnSpinButtonClicked(event:Event):void
		{
			SlotsMachineController(Controller).DoSpin(false);
		}
	}
}