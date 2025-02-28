package com.gotchaslots.slots.ui.machine.reelsPanel
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.valuator.ValuatorsHandler;
	import com.gotchaslots.slots.data.machine.valuator.strike.StrikeValuatorData;
	import com.gotchaslots.common.ui.common.components.SpriteEx;
	import com.gotchaslots.slots.ui.machine.Symbol;
	import com.gotchaslots.common.utils.helpers.DisplayObjectHelper;
	import com.greensock.TweenLite;
	
	import flash.display.Bitmap;
	
	public class AnimatePaylines extends SpriteEx
	{
		// members
		private var _valuatorsHandler:ValuatorsHandler;
		private var _tweenLite:TweenLite;
		private var _tweener:SpriteEx;
		private var _selectedPaylines:int;
		
		// class
		public function AnimatePaylines()
		{
			super();
		}
		public override function Dispose():void
		{
			TweenLite.killTweensOf(_tweener);
			
			super.Dispose();
		}
		
		// methods
		public function Start(valuatorsHandler:ValuatorsHandler):void
		{
			if (valuatorsHandler && valuatorsHandler.Strike && valuatorsHandler.Strike.IsValuable)
			{
				_valuatorsHandler = valuatorsHandler;
				_selectedPaylines = Main.Instance.ActiveMachine.SelectedPaylines - 1;
				TweenPayline(0);
			}
		}
		private function TweenPayline(index:int):void
		{
			try
			{
				if (index < _selectedPaylines)
				{
					var strikeValuator:StrikeValuatorData = _valuatorsHandler.Strike.StrikeValuators[index];
					if (strikeValuator.IsValuable)
					{
						_tweener = new SpriteEx();
						_tweener.alpha = 0;
						
						var payline:Bitmap = strikeValuator.Payline.PaylineReelsPng;
						payline.width = 800;
						payline.height = 306;
						payline.alpha = 1;
						_tweener.addChild(payline);
						
						for (var i:int = 0; i < strikeValuator.Payboxes.length; i++)
						{
							var payboxPng:Bitmap = strikeValuator.Payline.PayboxPng;
							payboxPng.x = strikeValuator.Payboxes[i].PngLocation().x - 2;
							payboxPng.y = strikeValuator.Payboxes[i].PngLocation().y - 2;
							_tweener.addChild(payboxPng);
							
							var symbol:Symbol = strikeValuator.Symbols[i].GetSymbol(strikeValuator.Payboxes[i].Rect);
							symbol.x = payboxPng.x;
							symbol.y = payboxPng.y;
							symbol.width = payboxPng.width;
							symbol.height = payboxPng.height;
							_tweener.addChild(symbol);
						}
						
						addChild(_tweener);
						_tweenLite = TweenLite.to(_tweener, 0.375, {alpha:1.5, delay:index == 0 ? 1 : 0, onComplete:OnAlphaToFull1Complete, onCompleteParams:[index, strikeValuator]});
					}
					else
					{
						index++;
						TweenPayline(index);
					}
				}
				else
				{
					TweenPayline(0);
				}
			}
			catch (error:Error)
			{
			}
		}
		private function OnAlphaToFull1Complete(index:int, strikeValuator:StrikeValuatorData):void
		{
			_tweenLite = TweenLite.to(_tweener, 0.125, {alpha:0.2, onComplete:OnAlphaToZero1Complete, onCompleteParams:[index, strikeValuator]});
		}
		private function OnAlphaToZero1Complete(index:int, strikeValuator:StrikeValuatorData):void
		{
			_tweenLite = TweenLite.to(_tweener, 0.375, {alpha:1.5, onComplete:OnAlphaToFull2Complete, onCompleteParams:[index, strikeValuator]});
		}
		private function OnAlphaToFull2Complete(index:int, strikeValuator:StrikeValuatorData):void
		{
			_tweenLite = TweenLite.to(_tweener, 0.125, {alpha:0, onComplete:OnAlphaToZero2Complete, onCompleteParams:[index, strikeValuator]});
		}
		private function OnAlphaToZero2Complete(index:int, strikeValuator:StrikeValuatorData):void
		{
			DisplayObjectHelper.SafeDisposeAllChildrens(_tweener);
			DisplayObjectHelper.SafeDisposeChild(this, _tweener);
			index++;
			TweenPayline(index);	
		}
		
		public function Stop():void
		{
			try
			{
				DisplayObjectHelper.SafeRemoveAllChildrens(this);
				
				if (_tweenLite)
				{
					_tweenLite.kill();
					_tweenLite = null;
				}
			}
			catch (error:Error)
			{
			}
		}
	}
}