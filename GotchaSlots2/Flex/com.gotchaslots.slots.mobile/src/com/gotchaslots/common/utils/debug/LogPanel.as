package com.gotchaslots.common.utils.debug
{
	import com.gotchaslots.common.ui.common.components.base.BaseComponent;
	import com.gotchaslots.common.ui.common.components.freeActionScript.scrollable.BaseVScrollbar;
	import com.gotchaslots.common.utils.helpers.DisplayObjectHelper;
	
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class LogPanel extends BaseVScrollbar
	{
		// singleton
		private static var _instance:LogPanel;
		public static function get Instance():LogPanel
		{
			if (_instance == null)
			{
				_instance = new LogPanel();
			}
			
			return _instance;
		}
		
		// members
		private var _content:BaseComponent;
		
		// properties
		protected override function get Content():BaseComponent
		{
			_content = new BaseComponent(W, 0);
			return _content;
		}
		
		// class
		public function LogPanel()
		{
			super(400, 800, 0xffffff);
			
			this.alpha = 0.8;
			doubleClickEnabled = true;
			addEventListener(MouseEvent.DOUBLE_CLICK, onDoubleClick);
		}
		
		// methods
		public function Write(text:*):void
		{
			var textField:TextField = new TextField();
			textField.y = _content.height;
			textField.width = this.width - 30;
			textField.height = 20;
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.wordWrap = true;
			textField.text = text;
			_content.addChild(textField);
		}
		
		// events
		protected function onDoubleClick(event:MouseEvent):void
		{
			DisplayObjectHelper.SafeDisposeAllChildrens(_content);
		}
	}
}