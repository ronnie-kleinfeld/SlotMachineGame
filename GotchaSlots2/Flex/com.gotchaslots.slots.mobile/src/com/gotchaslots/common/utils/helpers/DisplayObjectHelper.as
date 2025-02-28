package com.gotchaslots.common.utils.helpers
{
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.filters.ColorMatrixFilter;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	
	public class DisplayObjectHelper
	{
		// scale
		// this implementation is based on the excel in \Dropbox\Slots\Dev\Air\DisplayObjectHelper.Scale.xlsx
		public static function ScaleView(object:DisplayObject, targetRectangle:Rectangle, sourceRectangle:Rectangle):void
		{
			var scaleFactor:Number = Scale(targetRectangle, sourceRectangle);
			
			object.x = Location(targetRectangle, sourceRectangle).x;
			object.y = Location(targetRectangle, sourceRectangle).y;
			object.scaleX = scaleFactor;
			object.scaleY = scaleFactor;
		}
		public static function StrechView(object:DisplayObject, targetRectangle:Rectangle, sourceRectangle:Rectangle):void
		{
			object.x = 0;
			object.y = 0;
			object.scaleX = targetRectangle.width / sourceRectangle.width;
			object.scaleY = targetRectangle.height / sourceRectangle.height;
		}
		public static function Location(targetRectangle:Rectangle, sourceRectangle:Rectangle):Point
		{
			var scaleFactor:Number = Scale(targetRectangle, sourceRectangle);
			return new Point((targetRectangle.width - sourceRectangle.width * scaleFactor) / 2, (targetRectangle.height - sourceRectangle.height * scaleFactor) / 2);
		}
		public static function Scale(targetRectangle:Rectangle, sourceRectangle:Rectangle):Number
		{
			return Math.min(targetRectangle.width / sourceRectangle.width, targetRectangle.height / sourceRectangle.height);
		}
		
		// remove
		public static function SafeRemoveChild(container:DisplayObjectContainer, object:DisplayObject):void
		{
			try
			{
				container.removeChild(object);
			}
			catch (error:Error)
			{
			}
		}
		public static function SafeRemoveChildAt(container:DisplayObjectContainer, index:int):void
		{
			try
			{
				container.removeChildAt(index);
			}
			catch (error:Error)
			{
			}
		}
		public static function SafeRemoveAllChildrens(container:DisplayObjectContainer):void
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
			}
		}
		
		// dispose
		public static function SafeDisposeChild(container:DisplayObjectContainer, object:DisplayObject):void
		{
			try
			{
				var o:Object = container.removeChild(object);
				SafeDispose(o);
			}
			catch (error:Error)
			{
			}
		}
		public static function SafeDisposeChildAt(container:DisplayObjectContainer, index:int):void
		{
			try
			{
				var o:Object = container.removeChildAt(index);
				SafeDispose(o);
			}
			catch (error:Error)
			{
			}
		}
		public static function SafeDisposeAllChildrens(container:DisplayObjectContainer):void
		{
			try
			{
				while (container.numChildren > 0)
				{
					var o:Object = container.removeChildAt(0);
					SafeDispose(o);
				}
			}
			catch (error:Error)
			{
			}
		}
		private static function SafeDispose(o:Object):void
		{
			try
			{
				if (o is Shape)
				{
					var shape:Shape = Shape(o);
					shape.filters = null;
					shape.graphics.clear();
				}
				else if (o is Sprite)
				{
					var sprite:Sprite = Sprite(o);
					sprite.filters = null;
					sprite.graphics.clear();
				}
				else if (o is TextField)
				{
					var textField:TextField = TextField(o);
					textField.filters = null;
				}
				else if (o is Bitmap)
				{
					var bitmap:Bitmap = Bitmap(o);
					bitmap.filters = null;
				}
				else if (o is ColorMatrixFilter)
				{
					var colorMatrixFilter:ColorMatrixFilter = ColorMatrixFilter(o);
					colorMatrixFilter.matrix = null;
					colorMatrixFilter = null;
				}
				try
				{
					o.Dispose();
				}
				catch (error:Error)
				{
				}
				o = null;
			}
			catch (error:Error)
			{
			}
		}
	}
}