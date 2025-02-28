package com.gotchaslots.common.ui.common.components.freeActionScript.scrollable
{
	import com.gotchaslots.common.ui.common.components.base.BaseBG;
	import com.gotchaslots.common.ui.common.components.base.BaseComponent;
	import com.gotchaslots.common.utils.error.MustOverrideError;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.Shape;
	import flash.events.MouseEvent;
	
	public class BaseVScrollbar extends BaseBG
	{
		// members
		private var _mask:Shape;
		private var _content:BaseComponent;
		
		private var _mouseArmed:Boolean;
		private var _contentYArmed:int;
		private var _localYArmed:int;
		private var _recentMouseMoveY:int;
		
		private var _pad:VScrollbarPad;
		
		// properties
		protected override function get FrameCorner():Number
		{
			return 20;
		}
		protected function get Content():BaseComponent
		{
			throw new MustOverrideError();
		}
		
		// class
		public function BaseVScrollbar(w:int, h:int, bgColor:Number = 0x8330ba)
		{
			super(w, h, bgColor);
			
			_mask = new Shape();
			_mask.x = 6;
			_mask.y = 6;
			_mask.graphics.beginFill(0xff0000, 1);
			_mask.graphics.drawRect(0, 0, W - 12, H - 12);
			_mask.graphics.endFill();
			addChild(_mask);
			
			_content = Content;
			_content.x = 6;
			_content.y = 6;
			_content.mouseChildren = false;
			_content.mouseEnabled = false;
			_content.mask = _mask;
			addChild(_content);
			
			addEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			addEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			addEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			addEventListener(MouseEvent.ROLL_OUT, OnRollOut);
			
			var scrollbarThread:VScrollbarThread = new VScrollbarThread(4, _mask.height - 6, 0xce117b);
			scrollbarThread.x = W - 6 - 20 / 2 - 2;
			scrollbarThread.y = 9;
			addChild(scrollbarThread);
			
			_pad = new VScrollbarPad(20, 20, 0xce117b);
			_pad.x = W - 6 - 20;
			_pad.y = 6;
			addChild(_pad);
		}
		public override function Dispose():void
		{
			removeEventListener(MouseEvent.MOUSE_DOWN, OnMouseDown);
			removeEventListener(MouseEvent.MOUSE_UP, OnMouseUp);
			removeEventListener(MouseEvent.MOUSE_MOVE, OnMouseMove);
			removeEventListener(MouseEvent.ROLL_OUT, OnRollOut);
		}
		
		// events
		protected function OnMouseDown(event:MouseEvent):void
		{
			_mouseArmed = true;
			_localYArmed = event.localY;
			_contentYArmed = _content.y;
		}
		protected function OnMouseUp(event:MouseEvent):void
		{
			_mouseArmed = false;
		}
		protected function OnMouseMove(event:MouseEvent):void
		{
			if (_mouseArmed)
			{
				var newContentY:int = _contentYArmed + event.localY - _localYArmed;
				if (newContentY < _mask.y + _mask.height - _content.height)
				{
					newContentY = _mask.y + _mask.height - _content.height - 20;
				}
				if (newContentY > _mask.y)
				{
					newContentY = _mask.y + 20;
				}
				
				TweenLite.to(_content, 0.5, {y:newContentY, ease:Cubic.easeOut, onUpdate:OnUpdate, onComplete:OnComplete});
				_recentMouseMoveY = event.localY;
			}
		}
		private function OnUpdate():void
		{
			var padSpan:int = H - 6 - _pad.height;
			
			var padY:int = 6 + (_mask.y - _content.y) / (_content.height - _mask.height) * padSpan;
			padY = padY < 6 ? 6 : padY;
			padY = padY > padSpan ? padSpan : padY;
			_pad.y = padY;
		}
		private function OnComplete():void
		{
			if (_content.y < _mask.y + _mask.height - _content.height)
			{
				TweenLite.to(_content, 0.2, {y:_mask.y + _mask.height - _content.height, ease:Cubic.easeOut});
			}
			if (_content.y > _mask.y)
			{
				TweenLite.to(_content, 0.2, {y:_mask.y, ease:Cubic.easeOut, onUpdate:OnUpdate});
			}
		}
		protected function OnRollOut(event:MouseEvent):void
		{
			_mouseArmed = false;
		}
	}
}