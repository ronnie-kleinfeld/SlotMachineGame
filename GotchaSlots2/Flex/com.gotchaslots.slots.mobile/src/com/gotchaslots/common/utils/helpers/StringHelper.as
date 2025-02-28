package com.gotchaslots.common.utils.helpers
{
	public class StringHelper
	{
		public static function CamelToProper(original:String):String
		{
			var result:String;
			
			try
			{
				// add space before a capital letter
				var temp:String = original;
				result = temp.charAt(0);
				for (var i:int = 1; i < temp.length - 1; i++)
				{
					if (temp.charCodeAt(i) >= 65 && temp.charCodeAt(i) <= 90 && temp.charCodeAt(i + 1) >= 97 && temp.charCodeAt(i + 1) <= 122 ||
						temp.charCodeAt(i - 1) >= 97 && temp.charCodeAt(i - 1) <= 122 && temp.charCodeAt(i) >= 65 && temp.charCodeAt(i) <= 90)
					{
						result += " ";
					}
					result += temp.charAt(i);
				}
				result += temp.charAt(i + 1);
			}
			catch (error:Error)
			{
			}
			
			return result;
		}
		public static function ReplaceAll(original:String, str1:String, str2:String):String
		{
			return original.split(str1).join(str2);
		}
		public static function RemoveSpaces(original:String):String
		{
			return original.split(" ").join("");
		}
		public static function AddSpacesForCamelCase(original:String):String
		{
			// add space before any upper case
			for (var i:int = 65 ; i <= 90; i++)
			{
				original = ReplaceAll(original, String.fromCharCode(i), " " + String.fromCharCode(i));
			}
			
			// remove first space
			if (original.search(" ") == 0)
			{
				original = original.slice(1, original.length);
			}
			return original;
		}
	}
}