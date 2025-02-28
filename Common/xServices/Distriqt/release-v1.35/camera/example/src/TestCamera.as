package
{
	import com.distriqt.extension.camera.Camera;
	import com.distriqt.extension.camera.CameraParameters;
	import com.distriqt.extension.camera.CaptureDevice;
	import com.distriqt.extension.camera.events.CameraDataEvent;
	import com.distriqt.extension.camera.events.CameraEvent;
	
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.ByteArray;
	import flash.utils.getTimer;
	
	/**
	 * This is the main implementation class of the TestCamera application
	 * 
	 * The application demonstrates the usage of the Camera Native Extension
	 *  
	 * @author Michael Archbold (ma@distriqt.com)
	 * 
	 */
	public class TestCamera extends Sprite
	{
		public static const DEV_KEY : String = "your_dev_key";
		
		
		public function TestCamera()
		{
			super();
			create();
			init( DEV_KEY );
			test();
		}
		
		////////////////////////////////////////////////////////
		//	VARIABLES
		//
		
		private var _text		: TextField;
		
		private var _mode		: String = CameraParameters.FLASH_MODE_OFF;
		
		private var _bitmapData	: BitmapData;
		private var _bitmap		: Bitmap;
		
		private var _captureBitmapData	: BitmapData;
		private var _captureBitmap		: Bitmap;
		
		private var _options	: CameraParameters
		
		
		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//
		
		private function create( ):void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			
			var tf:TextFormat = new TextFormat();
			tf.size = 16;
			_text = new TextField();
			_text.defaultTextFormat = tf;
			_text.width = stage.stageWidth;
			_text.height = stage.stageHeight;
			_text.multiline = true;
			addChild( _text );
			
			_videoData  = new ByteArray();
			
			_bitmapData = new BitmapData( 640, 480, false );
			_bitmap = new Bitmap( _bitmapData );
			_bitmap.y = 200;
			_bitmap.scaleX = _bitmap.scaleY = 0.4;
			addChild( _bitmap );
			
			_captureBitmapData = new BitmapData( 640, 480, false );
			_captureBitmap = new Bitmap( _captureBitmapData );
			_captureBitmap.y = 500;
			_captureBitmap.scaleX = _captureBitmap.scaleY = 0.4;
			addChild( _captureBitmap );
			
			
			
		}
		
		public function init(dev_key:String):void
		{
			try
			{
				Camera.init( dev_key );
				
			}
			catch (e:Error)
			{
				message( e.message );
			}
		}
		
		public function test():void
		{
			try
			{
				message( "Camera.isSupported:      " + Camera.isSupported );
				message( "Camera.version:          " + Camera.instance.version );
				
				message( "isFlashSupported:        " + Camera.instance.isFlashSupported() );
				message( "isTorchSupported:        " + Camera.instance.isTorchSupported() );
				
				message( "isFocusSupported:        " + Camera.instance.isFocusSupported( CameraParameters.FOCUS_MODE_AUTO ) );
				message( "isExposureSupported:     " + Camera.instance.isExposureSupported( CameraParameters.EXPOSURE_MODE_LOCKED ) );
				message( "isWhiteBalanceSupported: " + Camera.instance.isWhiteBalanceSupported( CameraParameters.WHITE_BALANCE_MODE_AUTO ) );
				
				
				if (Camera.isSupported)
				{
					_options = new CameraParameters();
					_options.enableFrameBuffer = true;
					_options.presetMode = CameraParameters.PRESET_MEDIUM;
					
					var formats:Array = Camera.instance.getAvailableImageFormats();
					for each (var format:String in formats)
					{
						message( "format: " + format );
					}
					
					var devices:Array = Camera.instance.getAvailableDevices();
					for each (var device:CaptureDevice in devices)
					{
						message( "device:[" + device.id + "]::" + device.name + "@" + device.position + "\tflash=" + device.hasFlash +"\ttorch=" + device.hasTorch );
						if (device.position == CaptureDevice.POSITION_BACK)
						{
							_options.deviceId = device.id;
						}
					}
					
					
					Camera.instance.addEventListener( CameraEvent.VIDEO_FRAME, camera_videoFrameHandler, false, 0, true );
					Camera.instance.addEventListener( CameraDataEvent.CAPTURED_IMAGE, camera_capturedImageHandler, false, 0, true );
					Camera.instance.addEventListener( CameraEvent.IMAGE_SAVE_COMPLETE, camera_imageSaveCompleteHandler, false, 0, true );
					Camera.instance.addEventListener( CameraEvent.IMAGE_SAVE_ERROR, camera_imageSaveErrorHandler, false, 0, true );
				}
			}
			catch (e:Error)
			{
				message( e.message );
			}
			
			stage.addEventListener( Event.RESIZE, stage_resizeHandler, false, 0, true );
			stage.addEventListener( MouseEvent.CLICK, clickHandler, false, 0, true );
			
			initialiseCamera();
			
			NativeApplication.nativeApplication.addEventListener( Event.ACTIVATE, 	activateHandler );
			NativeApplication.nativeApplication.addEventListener( Event.DEACTIVATE, deactivateHandler );
			
		}
		
		
		
		private var _inited: Boolean = false;
		private function initialiseCamera():void
		{
			try
			{
				if (Camera.isSupported)
				{
					Camera.instance.initialise( _options );
				}
				_inited = true;
			}
			catch (e:Error)
			{
				message( e.message );
			}
		}
		
		private function release():void
		{
			try
			{
				// Release the camera
				if (Camera.isSupported)
				{
					Camera.instance.release();
				}
				_inited = false;
			}
			catch (e:Error)
			{
				message( e.message );
			}
		}
		
		private function finish():void
		{
			try
			{
				Camera.instance.release();
				message( "finished" );
			}
			catch (e:Error)
			{
				message( e.message );
			}
			
		}
		
		
		
		
		
		////////////////////////////////////////////////////////
		//	INTERNALS
		//
		
		private function message( str:String ):void
		{
			trace( str );
			_text.text = str + "\n" + _text.text;
		}
		
		
		////////////////////////////////////////////////////////
		//	EVENT HANDLERS
		//
		
		private var _time : Number;
		
		private function clickHandler( event:MouseEvent ):void
		{
			message( "click" );
			_time = getTimer();
			
//			var switchMode:Boolean = (Math.random() > 0.5);
//			
//			if (switchMode) Camera.instance.setPresetMode( CameraParameters.PRESET_640x480 );
//			else			Camera.instance.setPresetMode( CameraParameters.PRESET_PHOTO );
			
			Camera.instance.captureImage( false /* Change to true to save to camera roll */  );
			
		}
		
		
		//
		//	VIDEO FRAME DATA EXAMPLE
		//
		
		private var _lastFrameProcessed	: Number = -1;
		
		private var _videoData			: ByteArray = null;
		
		private function camera_videoFrameHandler( event:CameraEvent ):void
		{
			var frame:Number = Camera.instance.receivedFrames;
			if (frame != _lastFrameProcessed)
			{
				Camera.instance.getFrameBuffer( _videoData );
				
				var rect:Rectangle = new Rectangle( 0, 0, Camera.instance.width, Camera.instance.height );
				if (_bitmapData.width != Camera.instance.width || _bitmapData.height != Camera.instance.height)
				{
					_bitmapData = new BitmapData( Camera.instance.width, Camera.instance.height, false );
					_bitmap.bitmapData.dispose();
					_bitmap.bitmapData = _bitmapData;
				}
				
				try
				{
					_bitmapData.setPixels( rect, _videoData );
				}
				catch (e:Error)
				{
					message( "ERROR::setPixels: " + e.message );
				}
				
				_videoData.clear();
				_lastFrameProcessed = frame;
			}
			
		}
		
		
		//
		//	CAPTURE IMAGE EXAMPLE
		//
		
		private function camera_capturedImageHandler( event:CameraDataEvent ):void
		{
			message( "capture complete: " + String(Math.floor(getTimer() - _time) / 1000) );
			
			if (_captureBitmapData.width != event.data.width || _captureBitmapData.height != event.data.height)
			{
				_captureBitmapData = new BitmapData( event.data.width, event.data.height, false );
				_captureBitmap.bitmapData.dispose();
				_captureBitmap.bitmapData = _captureBitmapData;
			}
			
			try
			{
				_captureBitmapData.draw( event.data );
			}
			catch (e:Error)
			{
				trace( e.message );
			}
		}
		
		
		private function camera_imageSaveCompleteHandler( event:CameraEvent ):void
		{
			message( "image save complete: " +event.data );
		}
		
		
		private function camera_imageSaveErrorHandler( event:CameraEvent ):void
		{
			message("image save ERROR: "+event.data );
		}
		
		
		//
		//	GENERAL
		//
		
		private function activateHandler( event:Event ):void
		{
			//	Reinitialise the camera when application is activated again.
			initialiseCamera();
		}
		
		private function deactivateHandler( event:Event ):void
		{
			// Release the camera when the application is deactivated.
			release();
		}
		
		private function stage_resizeHandler( event:Event ):void
		{
			_text.width  = stage.stageWidth;
			_text.height = stage.stageHeight;
		}
	}
}
