package com.gotchaslots.slots.data.machine.symbol.base
{
	public class BaseCollectiblesSymbolData extends BaseScatterSymbolData
	{
		// class
		public function BaseCollectiblesSymbolData(id:int, pngClass:Class, symbolType:String, factor:Number, fiveInARowPayout:Number, fourInARowPayout:Number, threeInARowPayout:Number, twoInARowPayout:Number, oneInARowPayout:Number, description:String, note:String, payboxPngClass:Class)
		{
			super(id, pngClass, symbolType, factor, fiveInARowPayout, fourInARowPayout, threeInARowPayout, twoInARowPayout, oneInARowPayout, description, note, payboxPngClass);
		}
	}
}