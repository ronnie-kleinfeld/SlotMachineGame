package com.gotchaslots.slots.ui.notifications.popup.machine.machineInfo.machineInfoInformation
{
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.common.ui.common.components.base.BaseComponent;
	import com.gotchaslots.slots.ui.machine.Symbol;
	import com.gotchaslots.common.ui.notifications.popup.textFields.PopupGroupMessageLeftTextField;
	import com.gotchaslots.common.ui.notifications.popup.textFields.PopupGroupMessageRightTextField;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	public class MachineInfoInformation extends BaseComponent
	{
		// members
		private var _lobbyMachine:SlotsBaseLobbyMachineData;
		
		// class
		public function MachineInfoInformation(lobbyMachine:SlotsBaseLobbyMachineData)
		{
			_lobbyMachine = lobbyMachine;
			
			super(421, 260);
			
			var preview:Symbol = lobbyMachine.Symbols.PreviewSymbol.GetSymbol(new Rectangle(0, 0, 95, 95));
			addChild(preview);
			
			var matrixPreview:Bitmap = _lobbyMachine.MatrixPreviewPng;
			matrixPreview.x = 98;
			matrixPreview.width = 323;
			matrixPreview.height = 95;
			addChild(matrixPreview);
			
			AddInfoTextField(0, 421, "Max Paylines:", FormatterHelper.NumberToMoney(_lobbyMachine.Paylines.Paylines.length, 0, 0), onMaxPaylinesClick);
			AddInfoTextField(1, 421, "Opens on Level:", FormatterHelper.NumberToMoney(_lobbyMachine.OpensOnLevel.LevelNumber, 0, 0), null);
			AddInfoTextField(2, 421, "Symbols:", FormatterHelper.NumberToMoney(_lobbyMachine.Symbols.NormalSymbols.length, 0, 0), onNormalSymbolsClick);
			AddInfoTextField(3, 421, "Special Symbols:", FormatterHelper.NumberToMoney(_lobbyMachine.Symbols.SpecialSymbols.length, 0, 0), onSpecialSymbolsClick);
			AddInfoTextField(4, 421, "Max Payout:", FormatterHelper.NumberToMoney(_lobbyMachine.Symbols.MaxPayout), null);
		}
		
		// methods
		private function AddInfoTextField(index:int, w:int, label:String, value:String, onClick:Function):void
		{
			var labelTextField:PopupGroupMessageLeftTextField = new PopupGroupMessageLeftTextField(w, label);
			labelTextField.y = 98 + index * 33;
			try
			{
				labelTextField.addEventListener(MouseEvent.CLICK, onClick);
			}
			catch (error:Error)
			{
			}
			addChild(labelTextField);
			
			var valueTextField:PopupGroupMessageRightTextField = new PopupGroupMessageRightTextField(w, value);
			valueTextField.y = 98 + index * 33;
			try
			{
				valueTextField.addEventListener(MouseEvent.CLICK, onClick);
			}
			catch (error:Error)
			{
			}
			addChild(valueTextField);
		}
		
		// events
		protected function onMaxPaylinesClick(event:MouseEvent):void
		{
			dispatchEvent(new MachineInfoInformationEvent(MachineInfoInformationEvent.MaxPaylinesClicked));
		}
		protected function onNormalSymbolsClick(event:MouseEvent):void
		{
			dispatchEvent(new MachineInfoInformationEvent(MachineInfoInformationEvent.NormalSymbolsClicked));
		}
		protected function onSpecialSymbolsClick(event:MouseEvent):void
		{
			dispatchEvent(new MachineInfoInformationEvent(MachineInfoInformationEvent.SpecialSymbolsClicked));
		}
	}
}