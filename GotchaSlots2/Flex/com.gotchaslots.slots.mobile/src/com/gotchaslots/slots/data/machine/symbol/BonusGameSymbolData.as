package com.gotchaslots.slots.data.machine.symbol
{
	import com.gotchaslots.slots.assets.machine.scatterPayboxes.ScatterPayboxesEmbed;
	import com.gotchaslots.slots.assets.machine.symbols.SymbolsEmbed;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseScatterSymbolData;
	import com.gotchaslots.slots.data.machine.symbol.base.SymbolTypeEnum;
	
	public class BonusGameSymbolData extends BaseScatterSymbolData
	{
		// properties
		public override function get SpecialOdds():Number
		{
			return Main.Instance.Device.IsMobile ? 0.02 : 0.1 * _factor;
		}
		
		// class
		public function BonusGameSymbolData(id:int, pngClass:Class, factor:Number)
		{
			super(id, SymbolsEmbed.BonusGame, SymbolTypeEnum.BonusGame, factor, 20 * factor, 15 * factor, 10 * factor, 5 * factor, 0, "Bonus Game", "Win a bonus game", ScatterPayboxesEmbed.BonusGame);
		}
	}
}