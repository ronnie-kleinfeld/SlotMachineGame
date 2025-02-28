package com.gotchaslots.common.utils.helpers
{
	import by.blooddy.crypto.image.PNG24Encoder;
	
	import com.gotchaslots.common.data.Main;
	
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	public class CaptureHelper
	{
		public static function Capture(displayObject:DisplayObject, str:String, w:int, h:int):void
		{
			if (displayObject)
			{
				var bitmapData:BitmapData = new BitmapData(w, h, true, 0xffffff);
				bitmapData.draw(displayObject);
				
				var byteArray:ByteArray = PNG24Encoder.encode(bitmapData);
				
				var file:File = File.documentsDirectory;
				file = file.resolvePath(str +
					"_" + w + "x" + h + ".png");
				var writeStream:FileStream = new FileStream();
				writeStream.open(file, FileMode.WRITE);
				writeStream.writeBytes(byteArray);
				writeStream.close();
			}
		}
	}
}