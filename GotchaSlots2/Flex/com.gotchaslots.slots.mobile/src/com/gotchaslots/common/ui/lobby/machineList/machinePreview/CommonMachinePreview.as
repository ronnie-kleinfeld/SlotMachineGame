package com.gotchaslots.common.ui.lobby.machineList.machinePreview
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.ui.common.components.base.BaseClickableButton;
	import com.gotchaslots.common.ui.common.components.gradientBG.RadialGradientBG;
	import com.gotchaslots.common.ui.lobby.machineList.machinePreview.components.NewPreviewPng;
	import com.gotchaslots.common.ui.lobby.machineList.machinePreview.components.PreviewInvitePng;
	import com.gotchaslots.common.ui.lobby.machineList.machinePreview.components.PreviewLockedPng;
	import com.gotchaslots.slots.ui.machine.Symbol;
	import com.gotchaslots.slots.ui.notifications.SlotsNotificationsHandler;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	
	import flash.events.MouseEvent;
	import flash.filters.GlowFilter;
	import flash.geom.Rectangle;

	public class CommonMachinePreview extends BaseClickableButton
	{
		// members
		private var _lobbyMachine:SlotsBaseLobbyMachineData;
		
		private var _newPreview:NewPreviewPng;
		private var _previewLocked:PreviewLockedPng;
		private var _previewInvite:PreviewInvitePng;
		
		// properties
		protected override function get HasFrame():Boolean
		{
			return true;
		}
		protected override function get FrameColorHigh():Number
		{
			return 0x9436ce;
		}
		protected override function get FrameColorLow():Number
		{
			return 0x9436ce;
		}
		protected override function get FrameThickness():Number
		{
			return 3;
		}
		protected override function get FrameCorner():Number
		{
			return 20;
		}
		
		// class
		public function CommonMachinePreview(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			filters = [new GlowFilter(0xEC9EFE, 1, 20, 20)];
			
			addChild(new RadialGradientBG(160, 160, 20, 0xe7c0f7, 0x9436ce)); // magenta
			//addChild(new RadialGradientBG(160, 160, 16, 0x53f0fb, 0x00adf9)); // blue
			//addChild(new RadialGradientBG(160, 160, 16, 0x00adf9, 0x53f0fb)); // cyan
			//addChild(new RadialGradientBG(160, 160, 16, 0x01704b, 0x05e747)); // green
			
			_lobbyMachine = lobbyMachine;
			
			var preview:Symbol = lobbyMachine.Symbols.PreviewSymbol.GetSymbol(new Rectangle(0, 0, 140, 140));
			preview.x = preview.y = 12;
			addChild(preview);
			
			super(160, 160, null, "");
			
			_newPreview = new NewPreviewPng(_lobbyMachine);
			_newPreview.x = -10;
			_newPreview.y = -11;
			addChild(_newPreview);
			
			_previewLocked = new PreviewLockedPng(_lobbyMachine);
			_previewLocked.x = (W - _previewLocked.width) / 2;
			_previewLocked.y = 164;
			addChild(_previewLocked);
			
			_previewInvite = new PreviewInvitePng(_lobbyMachine);
			_previewInvite.x = 3;
			_previewInvite.y = H - _previewInvite.height;
			addChild(_previewInvite);
			
			SetOpenMode();
		}
		
		// methods
		private function SetOpenMode():void
		{
			if (_lobbyMachine.IsCommingSoon)
			{
				removeEventListener(MouseEvent.CLICK, OnClick);
			}
			else
			{
				addEventListener(MouseEvent.CLICK, OnClick);
			}
		}
		
		// events
		protected override function OnMouseDown(event:MouseEvent):void
		{
			if (!_isDisabled  && !_lobbyMachine.IsCommingSoon && _lobbyMachine.IsOpen)
			{
				this.filters = [new GlowFilter(0xffffff, 1, 20, 20)];
			}
		}
		protected override function OnMouseUp(event:MouseEvent):void
		{
			if (!_isDisabled && !_lobbyMachine.IsCommingSoon)
			{
				this.filters = null;
			}
		}
		protected override function OnRollOut(event:MouseEvent):void
		{
			if (!_isDisabled && !_lobbyMachine.IsCommingSoon)
			{
				this.filters = null;
			}
		}
		protected override function OnClick(event:MouseEvent):void
		{
			if (_lobbyMachine.IsOpen)
			{
				Main.Instance.Sounds.Play(SlotsSoundsManager.MachinePreview_Click);
				Main.Instance.CreateActiveMachine(_lobbyMachine);
				_lobbyMachine.MachineSession.NewMachine = false;
			}
			else
			{
				SlotsNotificationsHandler.Instance.ShowInvite4UnlockPopup(_lobbyMachine, null);
			}
		}
	}
}