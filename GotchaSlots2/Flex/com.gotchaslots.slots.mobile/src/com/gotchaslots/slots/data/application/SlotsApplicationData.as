package com.gotchaslots.slots.data.application
{
	import com.gotchaslots.common.data.application.CommonApplicationData;
	
	public class SlotsApplicationData extends CommonApplicationData
	{
		// members
		private var _allowedBetsChips:Vector.<Number>;
		
		// properties
		public function get AllowedBetsChips():Vector.<Number>
		{
			return _allowedBetsChips;
		}

		public function get EnableSpinButtonBit():Boolean
		{
			return true;
		}
		
		// class
		public function SlotsApplicationData()
		{
			super();
			InitAllowedBetChips();
		}
		private function InitAllowedBetChips():void
		{
			_allowedBetsChips = new Vector.<Number>();
			_allowedBetsChips.push(0.1);
			_allowedBetsChips.push(0.25);
			_allowedBetsChips.push(0.5);
			_allowedBetsChips.push(1);
			_allowedBetsChips.push(2);
			_allowedBetsChips.push(5);
			_allowedBetsChips.push(10);
			_allowedBetsChips.push(20);
			_allowedBetsChips.push(50);
			_allowedBetsChips.push(100);
			_allowedBetsChips.push(200);
			_allowedBetsChips.push(500);
			_allowedBetsChips.push(1000);
			_allowedBetsChips.push(2000);
			_allowedBetsChips.push(5000);
			_allowedBetsChips.push(10000);
			_allowedBetsChips.push(20000);
			_allowedBetsChips.push(50000);
			_allowedBetsChips.push(100000);
		}
		public function Dispose():void
		{
			while (_allowedBetsChips && _allowedBetsChips.length > 0)
			{
				_allowedBetsChips.pop();
			}
			_allowedBetsChips = null;
		}
		
		// methods
		public function GetBetIndexByBetChips(betChips:Number):int
		{
			for (var i:int = 0; i < _allowedBetsChips.length; i++)
			{
				if (_allowedBetsChips[i] == betChips)
				{
					return i;
				}
			}
			
			return 0;
		}
	}
}