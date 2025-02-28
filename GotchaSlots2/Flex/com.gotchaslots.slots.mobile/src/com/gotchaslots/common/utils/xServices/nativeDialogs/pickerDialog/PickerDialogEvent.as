package com.gotchaslots.common.utils.xServices.nativeDialogs.pickerDialog
{
	import flash.events.Event;

	public class PickerDialogEvent extends Event
	{
		// consts
		public static const SELECTED:String = "SELECTED";
		public static const CANCELED:String = "CANCELED";
		
		// members
		private var _items:Vector.<String>;
		private var _selectedItemIndex:int;
		
		// properties
		public function get Items():Vector.<String>
		{
			return _items;
		}
		public function get SelectedItemIndex():int
		{
			return _selectedItemIndex;
		}
		
		// class
		public function PickerDialogEvent(type:String, items:Vector.<String>, selectedItemIndex:int)
		{
			super(type);
	
			_items = items;
			_selectedItemIndex = selectedItemIndex;
		}
	}
}