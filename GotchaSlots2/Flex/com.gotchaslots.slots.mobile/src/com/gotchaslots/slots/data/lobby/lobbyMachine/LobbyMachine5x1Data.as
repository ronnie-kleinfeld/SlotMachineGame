package com.gotchaslots.slots.data.lobby.lobbyMachine
{
	import com.gotchaslots.slots.assets.notifications.animation.payboxesFrames.PayboxesFramesEmbed;
	import com.gotchaslots.slots.assets.notifications.animation.symetricFrames.SymetricFramesEmbed;
	import com.gotchaslots.slots.assets.paylines.paylines5x1.LinesEmbed5x1;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.data.machine.paylines.paylines.Paylines5x1Data;
	import com.gotchaslots.common.data.session.level.LevelData;
	
	public class LobbyMachine5x1Data extends SlotsBaseLobbyMachineData
	{
		// properties
		protected final override function get ColumnFramesClass():Vector.<Class>
		{
			return null;
		}
		protected final override function get SymetricFramesClass():Vector.<Class>
		{
			var symetricFramesClass:Vector.<Class> = new Vector.<Class>();
			symetricFramesClass.push(SymetricFramesEmbed.SymetricFrame5x1a);
			symetricFramesClass.push(SymetricFramesEmbed.SymetricFrame5x1b);
			return symetricFramesClass;
		}
		protected final override function get PayboxFramesClass():Vector.<Class>
		{
			var payboxFramesClass:Vector.<Class> = new Vector.<Class>();
			payboxFramesClass.push(PayboxesFramesEmbed.PayboxFrame5x1a);
			payboxFramesClass.push(PayboxesFramesEmbed.PayboxFrame5x1b);
			return payboxFramesClass;
		}
		protected final override function get PaylinesClass():Class
		{
			return Paylines5x1Data;
		}
		protected override function get MatrixPreviewClass():Class
		{
			return LinesEmbed5x1.MatrixPreview;
		}
		
		// class
		public function LobbyMachine5x1Data(id:int, machineName:String, normalSymbolsFunction:Function, bonusGameDataClass:Class, serverSymbolFileName:String, setPreviewSymbolID:int, factor:Number, maxPaylines:int, opensOnLevel:LevelData,
											isComingSoon:Boolean, depreciationRatio:Number, strikeValuator:Boolean, freeSpinsScatterValuator:Boolean, bombScatterValuator:Boolean, miniSpinScatterValuator:Boolean,
											collectiblesScatterValuator:Boolean, bonusGameValuator:Boolean, columnValuator:Boolean, symetricValuator:Boolean, multiplierScatterValuator:Boolean)
		{
			super(id, machineName, normalSymbolsFunction, bonusGameDataClass, serverSymbolFileName, setPreviewSymbolID, factor, maxPaylines, opensOnLevel, isComingSoon, depreciationRatio, strikeValuator, freeSpinsScatterValuator,
				bombScatterValuator, miniSpinScatterValuator, collectiblesScatterValuator, bonusGameValuator, columnValuator, symetricValuator, multiplierScatterValuator);
		}
	}
}