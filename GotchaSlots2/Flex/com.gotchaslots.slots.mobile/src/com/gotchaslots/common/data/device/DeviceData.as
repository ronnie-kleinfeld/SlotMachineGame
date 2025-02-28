package com.gotchaslots.common.data.device
{
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.utils.consts.DeviceTypeEnum;
	import com.gotchaslots.common.utils.debug.FrameRateHandler;
	import com.gotchaslots.common.utils.debug.LogPanel;
	import com.gotchaslots.common.utils.ex.EventDispatcherEx;
	
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.geom.Rectangle;
	import flash.system.Capabilities;
	
	public class DeviceData extends EventDispatcherEx
	{
		// members
		private var _stage:Stage;
		private var _deviceRectangle:Rectangle;
		private var _designRectangle:Rectangle;
		private var _goldenRectangle:Rectangle;
		private var _frameRate:FrameRateHandler;
		
		// properties
		public function get DeviceStage():Stage
		{
			return _stage;
		}
		public function get DeviceRectangle():Rectangle
		{
			if (_deviceRectangle == null)
			{
				_deviceRectangle = new Rectangle(0, 0, Math.max(_stage.fullScreenWidth, _stage.fullScreenHeight), Math.min(_stage.fullScreenWidth, _stage.fullScreenHeight));
			}
			return _deviceRectangle
		}
		
		public function get DesignRectangle():Rectangle
		{
			if (_designRectangle == null)
			{
				_designRectangle = new Rectangle(0, 0, 800, 494);
			}
			return _designRectangle
		}
		
		public function get GoldenRectangle():Rectangle
		{
			if (_goldenRectangle == null)
			{
				_goldenRectangle = new Rectangle(
					(DeviceRectangle.width - DesignRectangle.width * ScaleX) / 2,
					(DeviceRectangle.height - DesignRectangle.height * ScaleY) / 2,
					DesignRectangle.width * ScaleX,
					DesignRectangle.height * ScaleY);
			}
			return _goldenRectangle
		}
		
		public function get ScaleX():Number
		{
			//return Math.min(DeviceRectangle.width / DesignRectangle.width, DeviceRectangle.height / DesignRectangle.height);
			return DeviceRectangle.width / DesignRectangle.width;
		}
		public function get ScaleY():Number
		{
			//return Math.min(DeviceRectangle.width / DesignRectangle.width, DeviceRectangle.height / DesignRectangle.height);
			return DeviceRectangle.height / DesignRectangle.height;
		}
		
		public function get DeviceID():String
		{
			return Main.Instance.XServices.DeviceID.DeviceID;
		}
		
		public function get DeviceType():String
		{
			if (Capabilities.os.toUpperCase().search("IPHONE") >= 0)
			{
				return DeviceTypeEnum.IPHONE;
			}
			else if (Capabilities.os.toUpperCase().search("LINUX") >= 0)
			{
				return DeviceTypeEnum.ANDORID;
			}
			else
			{
				return "";
			}
		}
		
		public function get IsMobile():Boolean
		{
			return DeviceType == DeviceTypeEnum.IPHONE || DeviceType == DeviceTypeEnum.ANDORID;
		}
		
		public function get FrameRate():FrameRateHandler
		{
			return _frameRate;
		}
		
		// class
		public function DeviceData(stage:Stage)
		{
			super();
			
			_stage = stage;
			_stage.align = StageAlign.TOP_LEFT;
			_stage.scaleMode = StageScaleMode.NO_SCALE;
			_stage.displayState = StageDisplayState.FULL_SCREEN;
			_stage.frameRate = 60;
			LogPanel.Instance.Write(Capabilities.screenResolutionX + "," + Capabilities.screenResolutionY);
			
			_frameRate = new FrameRateHandler();
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			_deviceRectangle = null;
			_designRectangle = null;
			_goldenRectangle = null;
			
			if (_frameRate)
			{
				_frameRate.Dispose();
				_frameRate = null;
			}
		}
	}
}