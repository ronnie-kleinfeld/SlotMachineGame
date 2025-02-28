package com.gotchaslots.common.utils.mvc
{
	import com.gotchaslots.common.utils.error.MustOverrideError;
	import com.gotchaslots.common.utils.ex.EventDispatcherEx;
	
	import flash.events.Event;
	
	public class BaseMvcController extends EventDispatcherEx
	{
		// members
		protected var _view:BaseMvcView;
		
		// properties
		public function get View():BaseMvcView 
		{
			return _view;
		}
		
		// class
		public function BaseMvcController()
		{
			super();
			
			CreateView();
		}
		public function CreateView():void
		{
			throw new MustOverrideError();
			// overide this with View creation
			//_view = new BaseMvcView(this);
			// DO NOT init the view, Init is called from the controller.Init
		}
		public function Init():void
		{
			_view.addEventListener(Event.COMPLETE, OnViewComplete);
			_view.Init();
		}
		public override function Dispose():void
		{
			super.Dispose();
			
			if (_view)
			{
				_view.removeEventListener(Event.COMPLETE, OnViewComplete);
				_view.Dispose();
				_view = null;
			}
		}
		
		// events
		protected function OnViewComplete(event:Event):void
		{
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
}