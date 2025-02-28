package com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainLevel
{
	import com.gotchaslots.slots.data.machine.bonusGame.curtain.curtainItem.base.BaseCurtainItemData;
	import com.gotchaslots.common.utils.dataType.BaseIDData;
	
	import flash.display.DisplayObject;
	
	public class CurtainLevelData extends BaseIDData
	{
		// members
		private var _bgClass:Class;
		private var _bg:DisplayObject;
		
		private var _mapMessage:String;
		private var _tickerMessage:String;
		
		private var _curtainItems:Vector.<BaseCurtainItemData>;
		private var _selectiveItemsCount:int;
		private var _disposeLevelOnComplete:Boolean;
		
		// properties
		public function get BG():DisplayObject
		{
			if (_bgClass && !_bg)
			{
				var o:Object = new _bgClass();
				_bg = new _bgClass();
			}
			return _bg;
		}
		
		public function get MapMessage():String
		{
			return _mapMessage;
		}
		public function get TickerMessage():String
		{
			return _tickerMessage;
		}
		
		public function get CurtainItems():Vector.<BaseCurtainItemData>
		{
			return _curtainItems;
		}
		public function set CurtainItems(value:Vector.<BaseCurtainItemData>):void
		{
			_curtainItems = value;
		}
		public function get SelectiveItemsCount():int
		{
			return _selectiveItemsCount > _curtainItems.length ? _curtainItems.length : _selectiveItemsCount;
		}
		public function get SelectedItemsCount():int
		{
			var result:int;
			for (var i:int = 0; i < CurtainItems.length; i++)
			{
				if (CurtainItems[i].Selected)
				{
					result++;
				}
			}
			return result;
		}
		public function get DisposeLevelOnComplete():Boolean
		{
			return _disposeLevelOnComplete;
		}
		
		// class
		public function CurtainLevelData(id:int, bgClass:Class, mapMessage:String, tickerMessage:String, selectiveItemsCount:int, disposeLevelOnComplete:Boolean)
		{
			super(id);
			
			_bgClass = bgClass;
			
			_mapMessage = mapMessage;
			_tickerMessage = tickerMessage;
			
			_curtainItems = new Vector.<BaseCurtainItemData>();
			_selectiveItemsCount = selectiveItemsCount;
			_disposeLevelOnComplete = disposeLevelOnComplete;
		}
	}
}