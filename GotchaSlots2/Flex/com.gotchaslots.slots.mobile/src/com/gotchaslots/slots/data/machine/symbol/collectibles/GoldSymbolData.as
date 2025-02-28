package com.gotchaslots.slots.data.machine.symbol.collectibles
{
	import com.gotchaslots.slots.assets.machine.scatterPayboxes.ScatterPayboxesEmbed;
	import com.gotchaslots.slots.assets.machine.symbols.SymbolsEmbed;
	import com.gotchaslots.slots.data.machine.symbol.base.BaseCollectiblesSymbolData;
	import com.gotchaslots.slots.data.machine.symbol.base.SymbolTypeEnum;
	
	public class GoldSymbolData extends BaseCollectiblesSymbolData
	{
		// class
		public function GoldSymbolData(id:int, pngClass:Class, factor:Number)
		{
			super(id, SymbolsEmbed.Gold, SymbolTypeEnum.Gold, factor, 1, 1, 1, 1, 1, "Gold", "Collect this symbol to win some free Chips", ScatterPayboxesEmbed.Gold);
		}
	}
}