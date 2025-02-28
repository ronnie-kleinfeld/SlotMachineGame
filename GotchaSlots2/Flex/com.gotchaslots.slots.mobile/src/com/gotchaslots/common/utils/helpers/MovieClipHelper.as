package com.gotchaslots.common.utils.helpers 
{
	import infrastructure.log.LogHandler;
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.filters.ColorMatrixFilter;
	
	public class MovieClipHelper
	{
		public static function AddFrameScriptOnEachFrame(movieClip:MovieClip, func:Function):void
		{
			for (var i:int = 0; i < movieClip.totalFrames; i++)
			{
				movieClip.addFrameScript(Event.ENTER_FRAME, func);
			}
		}
		public static function AddStopOnFrame(movieClip:MovieClip, frame:int):void
		{
			movieClip.addFrameScript(frame, function():void {movieClip.stop();});
		}
		public static function AddStopOnLastFrame(movieClip:MovieClip):void
		{
			movieClip.addFrameScript(movieClip.totalFrames - 1, function():void {movieClip.stop();});
		}
		public static function Enable(movieClip:MovieClip):void
		{
			EnableDisable(movieClip, true);
		}
		public static function Disable(movieClip:MovieClip):void
		{
			EnableDisable(movieClip, false);
		}
		private static function EnableDisable(movieClip:MovieClip, enable:Boolean):void
		{
			movieClip.buttonMode = enable;
			movieClip.mouseEnabled = enable;
			movieClip.mouseChildren = enable;
		}
		public static function AddGrayscaleFilter(movieClip:MovieClip):void
		{
			var b:Number = 1 / 3;
			var c:Number = 1 - (b * 2);
			var mtx:Array = [c, b, b, 0, 0,
				b, c, b, 0, 0,
				b, b, c, 0, 0,
				0, 0, 0, 1, 0];
			var mtxFilter:ColorMatrixFilter = new ColorMatrixFilter(mtx);
			movieClip.filters = [mtxFilter];
		}
		
		public static function CleanFilters(movieClip:MovieClip):void
		{
			movieClip.filters = [];
		}
		
		public static function GetFrameByLabel(movieClip:MovieClip, label:String):int
		{
			for each (var currLabel:Object in movieClip.currentLabels)
			{
				if (currLabel.name == label)
				{
					return currLabel.frame;
				}
			}
			
			return 1;
		}
	}
}