package com.gotchaslots.slots.data.machine.symbol
{
	import com.gotchaslots.slots.assets.machine.scatterPayboxes.ScatterPayboxesEmbed;
	import com.gotchaslots.slots.assets.machine.symbols.SymbolsEmbed;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseScatterSymbolData;
	import com.gotchaslots.slots.data.machine.symbol.base.SymbolTypeEnum;
	
	public class MultiplierSymbolData extends BaseScatterSymbolData
	{
		// properties
		public override function get SpecialOdds():Number
		{
			return 0.1 * _factor;
		}
		
		// class
		public function MultiplierSymbolData(id:int, pngClass:Class, factor:Number)
		{
			super(id, SymbolsEmbed.Multiplier, SymbolTypeEnum.Multiplier, factor, 5, 4, 3, 2, 1, "Multiplier", "Get your total bet multiplied by the count of symbols", ScatterPayboxesEmbed.Multiplier);
		}
	}
}