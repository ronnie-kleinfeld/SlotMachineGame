package com.gotchaslots.common.utils.helpers
{
	import flash.utils.Dictionary;
	
	public class DictionaryHelper
	{
		public static function ToObject(dictionary:Dictionary):Object
		{
			var oResult:Object = new Object();
			
			for (var key:String in dictionary) 
			{
				if (dictionary[key] == null)
				{
					oResult[key] = "NULL";
				}
				else if (dictionary[key] == Dictionary)
				{
					//oResult[key] = DictionaryUtil.ToObject(dictionary[key]);
				}
				else if (dictionary[key] == Array)
				{
					//oResult[key] = ArrayUtil.ToObject(dictionary[key]);
				}
				else
				{
					oResult[key] = dictionary[key];
				}
			}
			
			return oResult;
		}
	}
}