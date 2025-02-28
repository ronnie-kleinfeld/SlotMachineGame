package com.gotchaslots.common.utils.helpers
{
	import infrastructure.log.LogHandler;
	
	import fl.controls.List;
	
	import flash.display.DisplayObject;

	public class ListHelper
	{
		public static function GetItemByData(list:List, data:Object):Object
		{
			var result:Object;
			
			if (list != null)
			{
				for (var i:int = 0; i < list.length; i++)
				{
					if (list.getItemAt(i).data == data)
					{
						result = list.getItemAt(i);
						break;
					}
				}
			}
			
			return result;
		}
		public static function Enable(list:List):void
		{
			EnableDisable(list, true);
		}
		public static function Disable(list:List):void
		{
			EnableDisable(list, false);
		}
		private static function EnableDisable(list:List, enable:Boolean):void
		{
			list.buttonMode = enable;
			list.mouseEnabled = enable;
			list.mouseChildren = enable;
		}
		public static function DataToCSV(list:List):String
		{
			var result:String = "";
			
			if (list != null)
			{
				for (var i:int = 0; i < list.length; i++)
				{
					if (result == "")
					{
						result += list.getItemAt(i).data;
					}
					else
					{
						result += "," + list.getItemAt(i).data;
					}
				}
			}
			
			return result;
		}
		public static function DataToArray(list:List):Array
		{
			var result:Array = new Array();
			
			if (list != null)
			{
				for (var i:int = 0; i < list.length; i++)
				{
					result.push(list.getItemAt(i).data);
				}
			}
			
			return result;
		}
		
		public static function RemoveChild(container:List, object:DisplayObject):void
		{
			try
			{
				container.removeChild(object);
			}
			catch (error:Error)
			{
				LogHandler.Write(container, "container is null:" + (container == null).toString() + " object is null:" + (object == null).toString(), error);
			}
		}
		public static function RemoveAllChildrens(container:List):void
		{
			try
			{
				while (container.numChildren > 0)
				{
					container.removeChildAt(0);
				}
			}
			catch (error:Error)
			{
				LogHandler.Write(container, "container is null:" + (container == null).toString(), error);
			}
		}
	}
}