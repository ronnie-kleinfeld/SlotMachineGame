package com.gotchaslots.slots.ui.machine.bonusGameEngine.curtain
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.bonusGame.base.BonusGameDataEvent;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtain.BaseCurtainData;
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainLevel.CurtainLevelDataEvent;
	import com.gotchaslots.common.ui.common.components.base.BaseTextField;
	import com.gotchaslots.common.utils.helpers.FormatterHelper;
	
	import flash.events.Event;
	import flash.filters.BevelFilter;
	import flash.filters.GlowFilter;
	import flash.text.TextField;
	
	public class MapBox extends BaseTextField
	{
		// members
		private var _curtain:BaseCurtainData;
		
		// properties
		protected override function get HasFrame():Boolean
		{
			return true;
		}
		protected override function get FrameColorHigh():Number
		{
			return 0x8330ba;
		}
		protected override function get FrameColorLow():Number
		{
			return 0x8330ba;
		}
		protected override function get FrameFilters():Array
		{
			return [new BevelFilter(4, 45, 0x8330ba, 1, 0)];
		}
		protected override function get FrameCorner():Number
		{
			return 30;
		}
		
		protected override function get XFLTextField():TextField
		{
			return Main.Instance.TextFields.HudJackpot;
		}
		protected override function get MaxTextFieldSize():int
		{
			return 30;
		}
		private function GetText(chips:Number):String
		{
			if (_curtain.CurrentCurtainLevel)
			{
				if (_curtain.CurrentCurtainLevel.SelectiveItemsCount == 1)
				{
					return _curtain.CurrentCurtainLevel.MapMessage + "\n" +
						"Level " + (_curtain.CurrentLevelIndex + 1).toString() + "/" + _curtain.CurtainLevels.length + "\n" +
						FormatterHelper.NumberToMoney(chips);
				}
				else
				{
					if (_curtain.CurrentCurtainLevel.SelectedItemsCount + 1 > _curtain.CurrentCurtainLevel.SelectiveItemsCount)
					{
						return _curtain.CurrentCurtainLevel.MapMessage + "\n" +
							"Level " + (_curtain.CurrentLevelIndex + 1).toString() + "/" + _curtain.CurtainLevels.length + "\n" +
							"Item " + _curtain.CurrentCurtainLevel.SelectedItemsCount + "/" + _curtain.CurrentCurtainLevel.SelectiveItemsCount + "\n" +
							"Chips " + FormatterHelper.NumberToMoney(chips);
					}
					else
					{
						return _curtain.CurrentCurtainLevel.MapMessage + "\n" +
							"Level " + (_curtain.CurrentLevelIndex + 1).toString() + "/" + _curtain.CurtainLevels.length + "\n" +
							"Item " + (_curtain.CurrentCurtainLevel.SelectedItemsCount + 1).toString() + "/" + _curtain.CurrentCurtainLevel.SelectiveItemsCount + "\n" +
							"Chips " + FormatterHelper.NumberToMoney(chips);
					}
				}
			}
			else
			{
				return " ";
			}
		}
		
		// class
		public function MapBox(curtain:BaseCurtainData)
		{
			_curtain = curtain;
			
			super(_curtain.MapRect.width, _curtain.MapRect.height, GetText(0), null, 0xfdeaf4);
			
			filters = [new GlowFilter(0xEC9EFE, 1, 5, 5)];
			
			_curtain.addEventListener(BonusGameDataEvent.ChipsChanged, onChipsChanged);
			_curtain.addEventListener(CurtainLevelDataEvent.CurrentLevelChanged, onCurrentLevelChanged);
		}
		
		// events
		protected function onChipsChanged(event:BonusGameDataEvent):void
		{
			Text = GetText(event.Value);
		}
		protected function onCurrentLevelChanged(event:Event):void
		{
			Text = GetText(_curtain.Chips);
		}
	}
}