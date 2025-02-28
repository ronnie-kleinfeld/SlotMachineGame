package com.gotchaslots.common.data.application.prices
{
	public class ProductID
	{
		// consts
		public static const USD99:String = "e593f8a53c714c0c918c7b1eb958763e";
		public static const USD199:String = "0679418de7974e8db4dda527fc61ad17";
		public static const USD499:String = "f8a844ec2bdb4d0987cf6968a972a080";
		public static const USD999:String = "821d4d20a5f648c3bfbdde722f4e42d9";
		public static const USD1999:String = "bf854ae011b54e398a87c948085e7671";
		public static const USD4999:String = "bf472d0c0491423c9dd7c26448c306ab";
		public static const USD9999:String = "cdfe2f3221734c5eb32ec30db37ad72f";
		
		// properties
		public static function get ItemIDs():Vector.<String>
		{
			var itemIDs:Vector.<String> = new Vector.<String>();
			itemIDs.push(USD99);
			itemIDs.push(USD199);
			itemIDs.push(USD499);
			itemIDs.push(USD999);
			itemIDs.push(USD1999);
			itemIDs.push(USD4999);
			itemIDs.push(USD9999);
			return itemIDs;
		}
		
		// methods
		public static function DescriptionByProductID(productID:String):String
		{
			switch (productID)
			{
				case USD99:
					return "$0.99";
				case USD199:
					return "$1.99";
				case USD499:
					return "$4.99";
				case USD999:
					return "$9.99";
				case USD1999:
					return "$19.99";
				case USD4999:
					return "$49.99";
				case USD9999:
					return "$99.99";
				default:
					return "$0.99";
			}
		}
		public static function PriceByProductID(productID:String):Number
		{
			switch (productID)
			{
				case USD99:
					return 0.99;
				case USD199:
					return 1.99;
				case USD499:
					return 4.99;
				case USD999:
					return 9.99;
				case USD1999:
					return 19.99;
				case USD4999:
					return 49.99;
				case USD9999:
					return 99.99;
				default:
					return 0.99;
			}
		}
	}
}