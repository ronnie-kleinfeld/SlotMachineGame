package com.gotchaslots.slots.ui.machine.reelsPanel
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.paybox.PayboxData;
	import com.gotchaslots.slots.data.machine.paylines.payline.base.BasePaylineData;
	import com.gotchaslots.slots.data.machine.paylines.paylines.base.BasePaylinesData;
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.Shape;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	public class Reel extends SpriteEx
	{
		// members
		private var _column:int;
		private var _width:int;
		private var _height:int;
		
		private var _payboxWidth:int;
		private var _payboxHeight:int;
		
		private var _rowsCount:int;
		private var _columnsCount:int;
		
		// class
		public function Reel(column:int)
		{
			super();
			
			_column = column;
			
			var paylinesData:BasePaylinesData = Main.Instance.ActiveMachine.LobbyMachine.Paylines;
			_rowsCount = paylinesData.RowsCount;
			var paylines:Vector.<BasePaylineData> = paylinesData.Paylines;
			_columnsCount = paylines[0].ColumnsCount;
			var payboxes:Vector.<PayboxData> = paylinesData.Payboxes;
			
			x = payboxes[column].Rect.x;
			y = payboxes[column].Rect.y;
			_width = payboxes[column].Rect.width;
			_height = (payboxes[column].Rect.height * _rowsCount + 6 * (_rowsCount - 1));
			
			graphics.beginFill(0xffffff, 0.4);
			graphics.drawRoundRect(0, 0, _width, _height, 20, 20);
			graphics.endFill();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x00ff00, 1);
			shape.graphics.drawRect(0, 0, _width, _height);
			shape.graphics.endFill();
			addChild(shape);
			this.mask = shape;
			
			_payboxWidth = _width;
			_payboxHeight = payboxes[column].Rect.height;
			
			InitSprite();
		}
		private function InitSprite():void
		{
			var sprite:SpriteEx = new SpriteEx();
			sprite.y = _rowsCount * (6 + _payboxHeight);
			for (var i:int = 0; i < _rowsCount + 1; i++)
			{
				AddReelItem(sprite);
			}
			addChild(sprite);
		}
		public override function Dispose():void
		{
			while (numChildren > 1)
			{
				var sprite:SpriteEx = SpriteEx(removeChildAt(1));
				DisposeSprite(sprite);
			}
			
			this.mask = null;
			
			super.Dispose();
		}
		private function DisposeSprite(sprite:SpriteEx):void
		{
			if (sprite)
			{
				TweenLite.killTweensOf(sprite);
				sprite.Dispose();
			}
		}
		
		// methods
		public function Start():void
		{
			var sprite:SpriteEx = SpriteEx(getChildAt(1));
			
			// add dummy symbols
			for (var i:int = 0; i < (Main.Instance.ActiveMachine.IsSpeedSpin ? 8 : 15); i++)
			{
				AddReelItem(sprite);
			}
			
			// add result matrix symbols
			var resultMatrix:Dictionary = Main.Instance.ActiveMachine.GetResultMatrixHandler.ActiveResultMatrix.ResultMatrix;
			for (i = 0; i < _rowsCount; i++)
			{
				var id:int = _column + _columnsCount * (_rowsCount - 1 - i);
				AddReelItem(sprite, resultMatrix[id]);
			}
			
			// add another symbol because the reels tween down a little
			AddReelItem(sprite);
			
			TweenLite.to(sprite, Main.Instance.ActiveMachine.IsSpeedSpin ? 1.2 : 3,
				{y:(sprite.numChildren - 2) * (6 + _payboxHeight), delay:0.2 + _column / 20, ease:Back.easeInOut, easeParams:[Main.Instance.ActiveMachine.IsSpeedSpin ? 0.7 : 0.8], onComplete:OnComplete});
		}
		private function OnComplete():void 
		{
			var oldSprite:SpriteEx = SpriteEx(getChildAt(1));
			var newSprite:SpriteEx = new SpriteEx();
			newSprite.y = _rowsCount * (6 + _payboxHeight);
			for (var i:int = 0; i < _rowsCount + 1; i++)
			{
				AddReelItem(newSprite, GetIDFromOldSprite(oldSprite, oldSprite.numChildren - (_rowsCount - i + 2)));
			}
			addChildAt(newSprite, 1);
			DisposeSprite(SpriteEx(removeChild(oldSprite)));
			
			//Main.Instance.Sounds.Play(SoundsManager.Machine_Sequence_Reel_Stop);
			
			if (_column == _columnsCount - 1)
			{
				dispatchEvent(new Event(ReelsPanelEvent.ReelStopped));
			}
		}
		private function GetIDFromOldSprite(oldSprite:SpriteEx, index:int):int
		{
			var result:int;
			try
			{
				result = ReelItem(oldSprite.getChildAt(index)).BitmapID;
			}
			catch (error:Error)
			{
				result = -1;
			}
			return result;
		}
		public function ChangeToMiniSpinSymbol(paybox:PayboxData, symbolID:int):void
		{
			var sprite:SpriteEx = SpriteEx(getChildAt(1));
			var oldReelItem:ReelItem = ReelItem(sprite.getChildAt(Main.Instance.ActiveMachine.LobbyMachine.Paylines.RowsCount - paybox.Row));
			
			var newReelItem:ReelItem = new ReelItem(symbolID);
			newReelItem.y = oldReelItem.y;
			newReelItem.width = _payboxWidth;
			newReelItem.height = _payboxHeight;
			sprite.addChildAt(newReelItem, sprite.getChildIndex(oldReelItem));
			
			sprite.removeChild(oldReelItem);
		}
		public function Hide(paybox:PayboxData):void
		{
			var sprite:SpriteEx = SpriteEx(getChildAt(1));
			
			var childIndex:int = Main.Instance.ActiveMachine.LobbyMachine.Paylines.RowsCount - paybox.Row;
			var reelItem:ReelItem = ReelItem(sprite.getChildAt(childIndex));
			reelItem.visible = false;
		}
		public function Disolve(paybox:PayboxData, randomID:int):void
		{
			var sprite:SpriteEx = SpriteEx(getChildAt(1));
			var childIndex:int = Main.Instance.ActiveMachine.LobbyMachine.Paylines.RowsCount - paybox.Row;
			var reelItem:ReelItem = ReelItem(sprite.getChildAt(childIndex));
			reelItem.Hide();
		}
		public function Gravity(paybox:PayboxData, randomID:int):void
		{
			var sprite:SpriteEx = SpriteEx(getChildAt(1));
			var childIndex:int = Main.Instance.ActiveMachine.LobbyMachine.Paylines.RowsCount - paybox.Row;
			var reelItem:ReelItem = ReelItem(sprite.getChildAt(childIndex));
			sprite.removeChild(reelItem);
			
			// add symbol above
			var randomReelItem:ReelItem = new ReelItem(randomID);
			randomReelItem.y = -(sprite.numChildren + 1) * (6 + _payboxHeight);
			randomReelItem.width = _payboxWidth;
			randomReelItem.height = _payboxHeight;
			sprite.addChild(randomReelItem);
			
			// gravity symbols
			for (var i:int = childIndex; i < sprite.numChildren; i++)
			{
				reelItem = ReelItem(sprite.getChildAt(i));
				reelItem.Gravity(paybox.Rect.height, i - childIndex);
			}
		}
		
		private function AddReelItem(sprite:SpriteEx, id:int = -1):void
		{
			var reelItem:ReelItem = new ReelItem(id);
			reelItem.y = -sprite.numChildren * (6 + _payboxHeight);
			reelItem.width = _payboxWidth;
			reelItem.height = _payboxHeight;
			sprite.addChild(reelItem);
		}
	}
}