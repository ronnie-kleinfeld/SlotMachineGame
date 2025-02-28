package com.gotchaslots.slots.ui.machine.reelsPanel
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseSymbolData;
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	import com.gotchaslots.slots.ui.machine.Symbol;
	import com.greensock.TweenLite;
	import com.greensock.easing.CustomEase;
	
	import flash.display.DisplayObject;
	
	public class ReelItem extends SpriteEx
	{
		// members
		private var _bitmapID:int;
		
		// properties
		public function get BitmapID():int
		{
			return _bitmapID;
		}
		
		// class
		public function ReelItem(id:int = -1)
		{
			addChild(GetSymbol(id));
		}
		public override function Dispose():void
		{
			while (numChildren > 0)
			{
				var displayObject:DisplayObject = removeChildAt(0);
				try
				{
					Main.Instance.ActiveMachine.LobbyMachine.Symbols.Symbols[_bitmapID].ReturnSymbol(Symbol(displayObject));
				}
				catch (error:Error)
				{
				}
			}
			
			super.Dispose();
		}
		
		// methods
		private function GetSymbol(bitmapID:int = -1):Symbol
		{
			var _symbols:Vector.<BaseSymbolData> = Main.Instance.ActiveMachine.LobbyMachine.Symbols.Symbols;
			
			if (bitmapID == -1)
			{
				bitmapID = Math.floor(Math.random() * _symbols.length);
			}
			
			_bitmapID = bitmapID;
			var symbol:Symbol = _symbols[_bitmapID].GetSymbol(Main.Instance.ActiveMachine.LobbyMachine.Paylines.Payboxes[0].Rect);
			return symbol;
		}
		public function Hide():void
		{
			TweenLite.to(this, 0.2, {alpha:0});
		}
		public function Gravity(payboxHeight:int, index:int):void
		{
			CustomEase.create("gravityEase", [{s:0,cp:-0.4,e:-0.4},{s:-0.4,cp:-0.4,e:0.332},{s:0.332,cp:1.064,e:0.988},{s:0.988,cp:0.912,e:1}]);
			TweenLite.to(this, 1, {y:this.y + payboxHeight + 6, ease:CustomEase.byName("gravityEase")});
		}
	}
}