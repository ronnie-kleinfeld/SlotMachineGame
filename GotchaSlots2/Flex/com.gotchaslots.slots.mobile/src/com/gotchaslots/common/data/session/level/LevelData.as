package com.gotchaslots.common.data.session.level
{
	import com.gotchaslots.common.utils.consts.CommonConsts;
	import com.gotchaslots.common.utils.ex.EventDispatcherEx;
	
	public class LevelData extends EventDispatcherEx
	{
		// members
		private var _levelNumber:int;
		private var _minXP:int;
		private var _nextMinXP:int;
		private var _defaultBetLevelChips:LevelChipsData;
		private var _defaultBetsChips:Vector.<LevelChipsData>;
		private var _maxBetLevelChips:LevelChipsData;
		private var _maxBetsChips:Vector.<LevelChipsData>;
		
		// properties
		public function get LevelNumber():int
		{
			return _levelNumber;
		}
		public function get MinXP():int
		{
			return _minXP;
		}
		public function get NextMinXP():int
		{
			return _nextMinXP;
		}
		public function get DefaultBetLevelChips():LevelChipsData
		{
			return _defaultBetLevelChips;
		}
		public function get MaxBetLevelChips():LevelChipsData
		{
			return _maxBetLevelChips;
		}
		
		public function get FacebookConnectBonusChips():Number
		{
			return Math.floor(200 + LevelNumber * CommonConsts.GOLDEN_RATIO) * 3;		// 300	10,000
		}
		public function get WelcomeBonusChips():Number
		{
			return Math.floor(200 + LevelNumber * CommonConsts.GOLDEN_RATIO) * 2;			// 300	10,000
		}
		public function get LevelReachedBonusChips():Number
		{
			return Math.floor(200 + LevelNumber * CommonConsts.GOLDEN_RATIO);				// 300	10,000
		}
		public function get TimerBonusChips():Number
		{
			return Math.floor(LevelReachedBonusChips * CommonConsts.GOLDEN_PART_BIG);		// 200	 6,200
		}
		public function get InviteBonusChips():Number
		{
			return Math.floor(LevelReachedBonusChips * CommonConsts.GOLDEN_PART_SMALL);	// 124	 3,800
		}
		
		// class
		public function LevelData(levelNumber:int)
		{
			super();
			
			if (levelNumber < 1)
			{
				levelNumber = 1;
			}
			_levelNumber = levelNumber;
			InitXP();
			InitDefaultBetsChips();
			InitMaxBetsChips();
		}
		public function InitXP():void
		{
			// this XP calculation is based on the Levels.xlsx excel file
			
			var gSum:Number = 200;
			var xpSum:Number = 0;
			_minXP = 0;
			_nextMinXP = 0;
			for (var i:int = 1; i <= LevelNumber; i++)
			{
				gSum += i * CommonConsts.GOLDEN_PART_BIG;
				xpSum += gSum;
				_minXP = _nextMinXP;
				_nextMinXP += xpSum;
			}
		}
		private function InitDefaultBetsChips():void
		{
			_defaultBetsChips = new Vector.<LevelChipsData>();
			_defaultBetsChips.push(new LevelChipsData(1, 0.25));
			_defaultBetsChips.push(new LevelChipsData(2, 0.5));
			_defaultBetsChips.push(new LevelChipsData(4, 1));
			_defaultBetsChips.push(new LevelChipsData(7, 2));
			_defaultBetsChips.push(new LevelChipsData(10, 5));
			_defaultBetsChips.push(new LevelChipsData(13, 10));
			_defaultBetsChips.push(new LevelChipsData(21, 20));
			_defaultBetsChips.push(new LevelChipsData(28, 50));
			_defaultBetsChips.push(new LevelChipsData(37, 100));
			_defaultBetsChips.push(new LevelChipsData(52, 200));
			_defaultBetsChips.push(new LevelChipsData(66, 500));
			_defaultBetsChips.push(new LevelChipsData(82, 1000));
			_defaultBetsChips.push(new LevelChipsData(108, 2000));
			_defaultBetsChips.push(new LevelChipsData(131, 5000));
			_defaultBetsChips.push(new LevelChipsData(159, 10000));
			_defaultBetsChips.push(new LevelChipsData(202, 20000));
			_defaultBetsChips.push(new LevelChipsData(242, 50000));
			
			_defaultBetLevelChips = LevelChipsByLevelNumber(_defaultBetsChips, LevelNumber);
		}
		private function InitMaxBetsChips():void
		{
			_maxBetsChips = new Vector.<LevelChipsData>();
			_maxBetsChips.push(new LevelChipsData(1, 1));
			_maxBetsChips.push(new LevelChipsData(2, 2));
			_maxBetsChips.push(new LevelChipsData(5, 5));
			_maxBetsChips.push(new LevelChipsData(10, 10));
			_maxBetsChips.push(new LevelChipsData(17, 20));
			_maxBetsChips.push(new LevelChipsData(32, 50));
			_maxBetsChips.push(new LevelChipsData(47, 100));
			_maxBetsChips.push(new LevelChipsData(64, 200));
			_maxBetsChips.push(new LevelChipsData(92, 500));
			_maxBetsChips.push(new LevelChipsData(119, 1000));
			_maxBetsChips.push(new LevelChipsData(153, 2000));
			_maxBetsChips.push(new LevelChipsData(210, 5000));
			_maxBetsChips.push(new LevelChipsData(266, 10000));
			_maxBetsChips.push(new LevelChipsData(336, 20000));
			_maxBetsChips.push(new LevelChipsData(458, 50000));
			_maxBetsChips.push(new LevelChipsData(577, 100000));
			
			_maxBetLevelChips = LevelChipsByLevelNumber(_maxBetsChips, LevelNumber);
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			var levelChips:LevelChipsData;
			
			if (_defaultBetLevelChips)
			{
				_defaultBetLevelChips.Dispose();
				_defaultBetLevelChips = null;
			}
			while (_defaultBetsChips && _defaultBetsChips.length > 0)
			{
				levelChips = _defaultBetsChips.pop();
				levelChips.Dispose();
				levelChips = null;
			}
			_defaultBetsChips = null;
			
			if (_maxBetLevelChips)
			{
				_maxBetLevelChips.Dispose();
				_maxBetLevelChips = null;
			}
			while (_maxBetsChips && _maxBetsChips.length > 0)
			{
				levelChips = _maxBetsChips.pop();
				levelChips.Dispose();
				levelChips = null;
			}
			_maxBetsChips = null;
		}
		
		// level bets
		public function LevelChipsByLevelNumber(levelsChips:Vector.<LevelChipsData>, levelNumber:int):LevelChipsData
		{
			var result:LevelChipsData = levelsChips[0];
			
			for (var i:int = 0; i < levelsChips.length; i++) 
			{
				if (levelsChips[i].LevelNumber <= levelNumber)
				{
					result = levelsChips[i];
				}
				else
				{
					break;
				}
			}
			
			return result;
		}
		
		// static
		public static function GetLevelNumberByXP(xp:Number):int
		{
			var gSum:Number = 200;
			var xpSum:Number = 0;
			var minXP:int = 0;
			var nextMinXP:int = 0;
			for (var i:int = 1; i <= int.MAX_VALUE; i++)
			{
				gSum += i * CommonConsts.GOLDEN_PART_BIG;
				xpSum += gSum;
				minXP = nextMinXP;
				nextMinXP += xpSum;
				
				if (xp >= minXP && xp < nextMinXP)
				{
					return i;
				}
			}
			
			return 1;
		}
	}
}