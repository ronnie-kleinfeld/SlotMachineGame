package com.gotchaslots.common.ui.common.components.base
{
	import com.gotchaslots.common.utils.helpers.DisplayObjectHelper;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.Bitmap;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class BaseTextField extends BasePng
	{
		// members
		private var _textField:TextField;
		
		// properties
		protected function get XFLTextField():TextField
		{
			// return Main.Instance.TextFields.PopupTitle;
			return null;
		}
		public function set SetTextField(value:TextField):void
		{
			_textField = value;
		}
		protected function get TextFieldOffsetX():int
		{
			return 0;
		}
		protected function get TextFieldOffsetY():int
		{
			return 0;
		}
		protected function get MaxTextFieldSize():int
		{
			return 100;
		}
		protected function get Align():String
		{
			return TextFormatAlign.CENTER;
		}
		public final function set Text(text:String):void
		{
			SetText(_textField, text);
		}
		
		// class
		public function BaseTextField(w:int, h:int, text:String, png:Bitmap = null, bgColor:Number = Number.NaN)
		{
			super(w, h, png, bgColor);
			
			AddTextField(w, h, text);
		}
		private function AddTextField(w:int, h:int, text:String):void
		{
			if (XFLTextField && text)
			{
				_textField = XFLTextField;
				_textField.multiline = true;
				_textField.selectable = false;
				_textField.x = TextFieldOffsetX;		//(width - _textField.width) / 2;
				_textField.y = TextFieldOffsetY;		//(height - _textField.height) / 2;
				_textField.width = w;
				_textField.height = h;
				Text = text;
				addChild(_textField);
			}
		}
		
		// methods
		private function SetText(textField:TextField, text:String):void
		{
			if (textField)
			{
				var textFormat:TextFormat = textField.getTextFormat();
				textField.text = text;
				textField.setTextFormat(textFormat);
				textField.autoSize = TextFieldAutoSize.CENTER;
				
				while ((textField.width < W - 6 || textField.height < H) && textFormat.size < MaxTextFieldSize)
				{
					textFormat.size = int(textFormat.size) + 1;
					textField.text = text;
					textField.setTextFormat(textFormat);
					textField.autoSize = TextFieldAutoSize.CENTER;
				}
				while ((textField.width > W - 6 || textField.height > H) && textFormat.size > 8)
				{
					textFormat.size = int(textFormat.size) - 1;
					textField.text = text;
					textField.setTextFormat(textFormat);
					textField.autoSize = TextFieldAutoSize.CENTER;
				}
				
				switch (Align)
				{
					case TextFormatAlign.LEFT:
						textField.x = TextFieldOffsetX;
						break;
					case TextFormatAlign.CENTER:
						textField.x = (this.width - textField.width) / 2 + TextFieldOffsetX;
						break;
					case TextFormatAlign.RIGHT:
						textField.x = this.width - textField.width + TextFieldOffsetX;
						break;
					default:
						textField.x = (this.width - textField.width) / 2 + TextFieldOffsetX;
						break;
				}
				
				textField.y = (this.height - textField.height) / 2 + TextFieldOffsetY;
			}
		}
		public final function Bubble(diffY:Number, diffX:Number):void
		{
			if (!isNaN(diffY))
			{
				TweenLite.to(_textField, 3, {y:diffY, ease:Cubic.easeOut, onComplete:OnBubbleComplete});
			}
			if (!isNaN(diffX))
			{
				TweenLite.to(_textField, 3, {x:diffX, ease:Cubic.easeOut, onComplete:OnBubbleComplete});
			}
		}
		
		// events
		private function OnBubbleComplete():void
		{
			TweenLite.to(_textField, 0.3, {alpha:0, onComplete:OnAlphaComplete});
		}
		private function OnAlphaComplete():void
		{
			DisplayObjectHelper.SafeDisposeChild(parent, this);
		}
	}
}