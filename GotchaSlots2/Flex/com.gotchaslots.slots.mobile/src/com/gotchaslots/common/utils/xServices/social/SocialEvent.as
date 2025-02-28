package com.gotchaslots.common.utils.xServices.social
{
	import flash.events.Event;
	
	public class SocialEvent extends Event
	{
		// consts
		public static const FacebookLogonChanged:String = "7e38b79a2aef4e608e245314504a209e";
		
		public static const FacebookLoggedIn:String = "56dac71aad7e45ca98ff338e580814e8";
		public static const FacebookLoggedOut:String = "21b04f6fd46e42668d8be50bdf548450";
		
		public static const InviteFriendsDialogComplete:String = "a26d4a8c66404e26819633343d7ef891";
		public static const FeedShareRequestComplete:String = "2d73f75cc11d486e830bf1d78031c1ac";
		
		public static const MailSent:String = "3c9d2663d528404888077de4df30a72f";
		public static const MailSaved:String = "5808eca622cf4bb885055855f9a69b90";
		
		public static const Failed:String = "5a15dd016bbc49619544afeffe79c2cd";
		
		// members
		private var _ids:Vector.<String>;
		
		// properties
		public function get IDs():Vector.<String>
		{
			return _ids;
		}
		
		// class
		public function SocialEvent(type:String, ids:Vector.<String> = null)
		{
			super(type);
			
			_ids = ids;
		}
	}
}