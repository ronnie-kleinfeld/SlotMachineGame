package com.gotchaslots.common.utils.helpers
{

	public class CSVHelper
	{
		public static function RemoveDuplicates(csv:String):String
		{
			if (csv == "" || csv == null)
			{
				return "";
			}
			else
			{
				var array:Array = csv.split(",");
				array = ArrayHelper.RemoveDuplicates(array);
				return array.join(",");
			}
		}
	}
}