package com.gotchaslots.common.utils.dataAdapter.manager
{
	import br.com.stimuli.loading.BulkLoader;
	import br.com.stimuli.loading.BulkProgressEvent;
	
	import com.gotchaslots.common.utils.dataAdapter.api.base.BaseApi;
	import com.gotchaslots.common.utils.error.SwitchOutOfBoundError;
	import com.gotchaslots.common.utils.ex.EventDispatcherEx;
	
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.system.Security;
	import flash.system.SecurityDomain;
	
	public class DataAdapterHandler extends EventDispatcherEx
	{
		// events
		public static const Message:String = "5e154556ce004a7fb841396b1db54689";
		public static const ExecuteFinished:String = "65483499a89c467aa296375490ca98b0";
		public static const ServerError:String = "7f28aa32b0c7486ba0d242ceabac4d0b";
		
		// members
		private var _bulkLoader:BulkLoader;
		private var _baseApis:Vector.<BaseApi>;
		
		// properties
		public function get GetBulkLoader():BulkLoader
		{
			return _bulkLoader;
		}
		
		// class
		public function DataAdapterHandler()
		{
			super();
			
			_baseApis = new Vector.<BaseApi>();
			
			// BulkLoader
			_bulkLoader = new BulkLoader();
			_bulkLoader.addEventListener(BulkLoader.PROGRESS, OnBulkLoaderProgress);
			_bulkLoader.addEventListener(BulkLoader.COMPLETE, OnBulkLoaderComplete);
			_bulkLoader.addEventListener(BulkLoader.ERROR, OnBulkLoaderError);
		}
		public override function Dispose():void
		{
			if (_bulkLoader != null)
			{
				_bulkLoader.removeEventListener(BulkLoader.ERROR, OnBulkLoaderError);
				_bulkLoader.removeEventListener(BulkLoader.COMPLETE, OnBulkLoaderComplete);
				_bulkLoader.removeEventListener(BulkLoader.PROGRESS, OnBulkLoaderProgress);
				_bulkLoader.clear();
				_bulkLoader = null;
			}
		}
		
		// params
		public function AddApi(baseApi:BaseApi, appDomain:ApplicationDomain = null):void
		{
			_baseApis.push(baseApi);
			
			baseApi.ServerGW = this;
			
			var prop:Object = new Object();
			prop.id = baseApi.Key;
			prop.maxTries = baseApi.MaxTries;
			
			var loaderContext:LoaderContext = new LoaderContext();
			loaderContext.securityDomain = SecurityDomain.currentDomain;
			loaderContext.checkPolicyFile = true;
			//loaderContext.applicationDomain = ApplicationDomain.currentDomain;
			/*
			loaderContext.allowCodeImport = true;
			loaderContext.allowLoadBytesCodeExecution = true;
			if (appDomain != null)
			{
			loaderContext.applicationDomain = appDomain;
			}
			*/
			if (Security.sandboxType == Security.REMOTE)
			{
				prop.context = loaderContext;
			}
			
			if (baseApi.BulkLoaderType == BulkLoader.TYPE_BINARY)
			{
				prop.type = BulkLoader.TYPE_BINARY;
			}
			
			_bulkLoader.add(baseApi.GetURLRequestEx.UrlRequest, prop);
		}
		
		// request
		public function Execute():void
		{
			_bulkLoader.start();
		}
		
		// response
		public function GetResponse(Key:String):*
		{
			for each (var baseApi:BaseApi in _baseApis)
			{
				if (baseApi.Key == Key)
				{
					return baseApi.GetResponse();
				}
			}
			
			throw new Error("Api key: " + Key + " not found in BulkLoader");
		}
		
		// events
		private function OnBulkLoaderProgress(event:BulkProgressEvent):void
		{
			dispatchEvent(event);
		}
		private function OnBulkLoaderComplete(event:Event):void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
		private function OnBulkLoaderError(event:Event):void
		{
			var serverErrorAction:int = DataAdapterHandlerErrorActionEnum.BUBBLE; // default behaviour for errors
			
			for each (var item:Object in _bulkLoader.items)
			{
				if (item.status == "error")
				{
					for each (var baseApi:BaseApi in _baseApis)
					{
						if (baseApi.Url == "image path is loaded dynamically")
						{
							serverErrorAction = baseApi.ServerErrorAction;
							break;
						}
						else
						{
							if (baseApi.Url == item.id)
							{
								if (baseApi.ServerErrorAction > serverErrorAction)
								{
									serverErrorAction = baseApi.ServerErrorAction;
								}
								break;
							}
						}
					}
				}
			}
			
			switch (serverErrorAction)
			{
				case DataAdapterHandlerErrorActionEnum.IGNORE:
					break;
				case DataAdapterHandlerErrorActionEnum.SILENCE:
					break;
				case DataAdapterHandlerErrorActionEnum.ERROR_POPUP:
					ShowErrorPopup();
					break;
				case DataAdapterHandlerErrorActionEnum.BUBBLE:
					dispatchEvent(new Event(ServerError));
					break;
				default:
					throw new SwitchOutOfBoundError(serverErrorAction);
			}
			
			dispatchEvent(new Event(ErrorEvent.ERROR))
		}
		
		// error
		private function ShowErrorPopup():void
		{
			dispatchEvent(new Event(ServerError));
			
			// show the error dialog
			//PopUpManager.Instance.PushBadConnectionErrorPopup();
			//PopUpManager.Instance.Start();
		}
	}
}