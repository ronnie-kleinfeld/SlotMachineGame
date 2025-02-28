package com.gotchaslots.slots.ui.machine.bonusGameEngine.higherLower.spinner
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.bonusGame.higherLower.HigherLowerData;
	import com.gotchaslots.common.ui.common.components.base.BaseBG;
	import com.gotchaslots.common.utils.helpers.DisplayObjectHelper;
	import com.gotchaslots.slots.utils.sounds.SlotsSoundsManager;
	import com.greensock.TweenLite;
	import com.greensock.easing.Cubic;
	
	import flash.display.Shape;
	import flash.events.Event;
	
	public class SpinnerPanel extends BaseBG
	{
		// members
		private var _spinnerStrip:SpinnerStrip;
		private var _mask:Shape;
		private var _tf:SpinnerTextField;
		
		// properties
		protected override function get FrameCorner():Number
		{
			return 10;
		}
		
		// class
		public function SpinnerPanel(higherLowerBonusGame:HigherLowerData)
		{
			super(120, 120, 0x8330ba);
			
			var bg:Shape = new Shape();
			bg.graphics.beginFill(0xffa8cb, 1);
			bg.graphics.drawRoundRect(0, 0, 100, 100, FrameCorner, FrameCorner);
			bg.graphics.endFill();
			bg.x = bg.y = 10;
			addChild(bg);
			
			_mask = new Shape();
			_mask.graphics.beginFill(0, 0);
			_mask.graphics.drawRoundRect(0, 0, 100, 100, FrameCorner, FrameCorner);
			_mask.graphics.endFill();
			_mask.x = _mask.y = 10;
			addChild(_mask);
			
			_tf = new SpinnerTextField(higherLowerBonusGame.CurrentHigherLowerPayout().Random);
			_tf.x = _tf.y = 10;
			addChild(_tf);
		}
		
		// methods
		public function DoSpin(isHigher:Boolean, higherLowerBonusGame:HigherLowerData):void
		{
			if (_tf)
			{
				DisplayObjectHelper.SafeDisposeChild(this, _tf);
			}
			
			var random:int = higherLowerBonusGame.HigherLowerPayout(higherLowerBonusGame.CurrentIndex - 1).Random;
			while (random == higherLowerBonusGame.HigherLowerPayout(higherLowerBonusGame.CurrentIndex - 1).Random)
			{
				random = Math.ceil(Math.random() * 9);
			}
			higherLowerBonusGame.CurrentHigherLowerPayout().Random = random;
			
			if (isHigher && higherLowerBonusGame.CurrentHigherLowerPayout().Random > higherLowerBonusGame.HigherLowerPayout(higherLowerBonusGame.CurrentIndex - 1).Random ||
				!isHigher && higherLowerBonusGame.CurrentHigherLowerPayout().Random < higherLowerBonusGame.HigherLowerPayout(higherLowerBonusGame.CurrentIndex - 1).Random)
			{
				higherLowerBonusGame.CurrentHigherLowerPayout().IsWon = true;
			}
			
			if (_spinnerStrip)
			{
				DisplayObjectHelper.SafeDisposeChild(this, _spinnerStrip);				
			}
			_spinnerStrip = new SpinnerStrip(higherLowerBonusGame.HigherLowerPayout(higherLowerBonusGame.CurrentIndex - 1).Random, random);
			_spinnerStrip.x = 10 - 100 * 2;
			_spinnerStrip.y = 10;
			addChild(_spinnerStrip);
			_spinnerStrip.mask = _mask;
			
			TweenLite.to(_spinnerStrip, 2, {x:10 + 100 - _spinnerStrip.width, ease:Cubic.easeInOut, onUpdate:onSpinnerStripUpdate, onComplete:onSpinnerStripComplete});
		}
		
		// events
		private function onSpinnerStripUpdate():void
		{
			if ((int(_spinnerStrip.x * 10)) / 10 == (int(_spinnerStrip.x * 1000)) / 1000)
			{
				Main.Instance.Sounds.Play(SlotsSoundsManager.Machine_Sequence_MiniSpin_Spin);
			}
		}
		private function onSpinnerStripComplete():void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}