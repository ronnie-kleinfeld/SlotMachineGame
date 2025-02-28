package com.gotchaslots.common.ui.common.components.base
{
	import flash.display.Bitmap;
	import flash.events.MouseEvent;
	
	public class BaseSwitchableButton extends BaseButton
	{
		// members
		private var _selectedText:String;
		
		// class
		public function BaseSwitchableButton(w:int, h:int, onClickDispatch:Function, normalText:String, selectedText:String, normalPng:Bitmap = null, selectedPng:Bitmap = null, bgColor:Number = Number.NaN)
		{
			super(w, h, onClickDispatch, normalText, normalPng, selectedPng, bgColor);
			
			_selectedText = selectedText == "" ? normalText : selectedText;
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		}
		
		// methods
		public override function SetNormal():void
		{
			super.SetNormal();
			
			Text = _normalText;
			addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		}
		public override function SetSelected():void
		{
			super.SetSelected();
			
			Text = _selectedText;
			addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		}
		public override function SetDisabled():void
		{
			super.SetDisabled();
			
			removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
		}
		
		// events
		protected function OnMouseDown(event:MouseEvent):void
		{
			super.OnClick(event);
			if (!_isDisabled)
			{
				if (_isSelected)
				{
					SetNormal();
					OnNormal(event);
				}
				else
				{
					SetSelected();
					OnSelected(event);
				}
			}
		}
		protected function OnNormal(event:MouseEvent):void
		{
			// override to implement an in-button onNormal action
		}
		protected function OnSelected(event:MouseEvent):void
		{
			// override to implement an in-button onSelected action
		}
	}
}