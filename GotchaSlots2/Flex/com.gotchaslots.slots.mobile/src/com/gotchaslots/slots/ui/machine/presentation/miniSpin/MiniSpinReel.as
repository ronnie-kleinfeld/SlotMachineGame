package com.gotchaslots.slots.ui.machine.presentation.miniSpin
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.paybox.PayboxData;
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	import com.gotchaslots.slots.ui.machine.reelsPanel.ReelItem;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.Shape;
	import flash.events.Event;
	
	public class MiniSpinReel extends SpriteEx
	{
		// consts
		private const SYMBOLS_COUNT:int = 25;
		
		// members
		private var _paybox:PayboxData;
		
		private var _width:int;
		private var _height:int;
		
		private var _sprite:SpriteEx;
		
		// class
		public function MiniSpinReel(paybox:PayboxData)
		{
			super();
			
			_paybox = paybox;
			
			x = _paybox.Rect.x;
			y = _paybox.Rect.y;
			_width = _paybox.Rect.width;
			_height = _paybox.Rect.height;
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x00ff00, 1);
			shape.graphics.drawRect(0, 0, _width, _height);
			shape.graphics.endFill();
			addChild(shape);
			this.mask = shape;
			
			InitSprite();
		}
		private function InitSprite():void
		{
			_sprite = new SpriteEx();
			AddReelItem(_sprite, Main.Instance.ActiveMachine.LobbyMachine.Symbols.MiniSpinSymbol.ID);
			for (var i:int = 0; i < SYMBOLS_COUNT; i++)
			{
				AddReelItem(_sprite);
			}
			addChild(_sprite);
		}
		public override function Dispose():void
		{
			TweenLite.killTweensOf(_sprite, false);
			
			this.mask = null;
			
			super.Dispose();
		}
		
		// methods
		public function Start(index:int):void
		{
			TweenLite.to(_sprite, 1.5, {y:(_sprite.numChildren - 2) * (6 + _paybox.Rect.height), delay:Math.random() * 0.5, ease:Cubic.easeInOut, onUpdate:OnUpdate, onUpdateParams:[index], onComplete:OnComplete});
		}
		private function OnUpdate(index:int):void 
		{
			if (index == 0 && (int(_sprite.y * 10)) / 10 == (int(_sprite.y * 100)) / 100)
			{
				Main.Instance.Sounds.Play(SlotsSoundsManager.Machine_Sequence_MiniSpin_Spin);
			}
		}
		private function OnComplete():void 
		{
			var id:int = 0;
			
			Main.Instance.Sounds.Stop(SlotsSoundsManager.Machine_Sequence_MiniSpin_Spin);
			
			for (var i:int = 0; i < SYMBOLS_COUNT; i++)
			{
				var reelItem:ReelItem = ReelItem(_sprite.getChildAt(i));
				if (reelItem.y == -_sprite.y)
				{
					id = reelItem.BitmapID;
					break;
				}
			}
			
			Main.Instance.Sounds.Play(SlotsSoundsManager.Machine_Sequence_MiniSpin_Stop);
			
			dispatchEvent(new MiniSpinEvent(Event.COMPLETE, id, _paybox));
		}
		
		private function AddReelItem(sprite:SpriteEx, id:int = -1):void
		{
			var reelItem:ReelItem = new ReelItem(id == -1 ? Main.Instance.ActiveMachine.LobbyMachine.Symbols.RandomNormalID : id);
			reelItem.y = -sprite.numChildren * (6 + _paybox.Rect.height);
			reelItem.width = _paybox.Rect.width;
			reelItem.height = _paybox.Rect.height;
			sprite.addChild(reelItem);
		}
	}
}