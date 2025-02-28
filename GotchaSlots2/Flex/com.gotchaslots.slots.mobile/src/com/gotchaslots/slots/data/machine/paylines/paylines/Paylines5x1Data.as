package com.gotchaslots.slots.data.machine.paylines.paylines
{
	import com.gotchaslots.slots.assets.payboxes.payboxes5x1.PayboxesEmbed5x1;
	import com.gotchaslots.slots.assets.paylines.paylines5x1.LinesEmbed5x1;
	import com.gotchaslots.slots.data.machine.paybox.PayboxData;
	import com.gotchaslots.slots.data.machine.paylines.payline.Payline5Data;
	import com.gotchaslots.slots.data.machine.paylines.paylines.base.BasePaylinesData;
	import com.gotchaslots.slots.data.machine.resultMatrix.ResultMatrix5x1Data;
	
	public class Paylines5x1Data extends BasePaylinesData
	{
		// properties
		public override function get ResultMatrixClass():Class
		{
			return ResultMatrix5x1Data;
		}
		
		// class
		public function Paylines5x1Data(maxPaylines:int)
		{
			super(maxPaylines);
		}
		protected override function InitPayboxes():void
		{
			super.InitPayboxes();
			_payboxes[0] = new PayboxData(0, 48, 21, 136, 264, 0, 0);
			_payboxes[1] = new PayboxData(1, 190, 21, 136, 264, 0, 1);
			_payboxes[2] = new PayboxData(2, 332, 21, 136, 264, 0, 2);
			_payboxes[3] = new PayboxData(3, 474, 21, 136, 264, 0, 3);
			_payboxes[4] = new PayboxData(4, 616, 21, 136, 264, 0, 4);
		}
		protected override function InitPaylines(payboxes:Vector.<PayboxData>):void
		{
			super.InitPaylines(payboxes);
			_paylines.push(new Payline5Data(0, LinesEmbed5x1.Line_000, PayboxesEmbed5x1.Paybox_000, 0xCD9575, payboxes, 0, 1, 2, 3, 4));
		}
		protected override function InitHorizontalPaylines(payboxes:Vector.<PayboxData>):void
		{
			super.InitHorizontalPaylines(payboxes);
			_horizontalPaylines.push(new Payline5Data(0, LinesEmbed5x1.Line_000, PayboxesEmbed5x1.Paybox_000, 0xCD9575, payboxes, 0, 1, 2, 3, 4));
		}
	}
}