package com.gotchaslots.common.utils.dataAdapter.manager 
{
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	
	public class URLRequestEx
	{
		// members
		private var _urlRequest:URLRequest;
		
		// properties
		public function get UrlRequest():URLRequest
		{
			return _urlRequest;
		}
		
		// class
		public function URLRequestEx(url:String, method:String = URLRequestMethod.POST):void 
		{
			_urlRequest = new URLRequest(url);
			_urlRequest.method = method;
			
			_urlRequest.data = new URLVariables();
		}
		
		// methods
		public function AddPostParam(key:String, value:Object):void
		{
			URLVariables(_urlRequest.data)[key] = value;
		}
	}
}