package com.gotchaslots.common.ui.hud.topPanel.buttons
{
	import com.gotchaslots.common.assets.hud.topPanel.TopPanelEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.data.MainEvent;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	import com.greensock.TweenLite;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class HomeButton extends BaseClickableButton
	{
		// class
		public function HomeButton()
		{
			super(44, 44, null, null, new TopPanelEmbed.HomeNormal(), new TopPanelEmbed.HomeSelected());
			
			ShowHide(0);
			SetDisabled();
			
			Main.Instance.addEventListener(MainEvent.ActiveMachineDataCreated, OnActiveMachineDataCreated);
			Main.Instance.addEventListener(MainEvent.RemoveActiveMachineView, OnRemoveActiveMachineView);
		}
		public override function Dispose():void
		{
			Main.Instance.removeEventListener(MainEvent.ActiveMachineDataCreated, OnActiveMachineDataCreated);
			Main.Instance.removeEventListener(MainEvent.RemoveActiveMachineView, OnRemoveActiveMachineView);
			
			super.Dispose();
		}
		
		// methods
		private function ShowHide(alpha:int):void
		{
			TweenLite.to(this, 0.5, {alpha:alpha});
		}
		
		// events
		protected function OnActiveMachineDataCreated(event:Event):void
		{
			SetEnabled();
			ShowHide(1);
		}
		protected function OnRemoveActiveMachineView(event:Event):void
		{
			ShowHide(0);
			SetDisabled();
		}
		protected override function OnClick(event:MouseEvent):void
		{
			super.OnClick(event);
			Main.Instance.RemoveActiveMachine();
		}
	}
}