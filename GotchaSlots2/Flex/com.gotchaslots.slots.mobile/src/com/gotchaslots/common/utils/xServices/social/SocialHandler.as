package com.gotchaslots.common.utils.xServices.social
{
	import com.adobe.serialization.json.JSONEncoder;
	import com.gotchaslots.common.data.Main;
	import com.gotchaslots.common.utils.consts.DeviceTypeEnum;
	import com.gotchaslots.common.utils.ex.EventDispatcherEx;
	import com.gotchaslots.common.utils.helpers.StringHelper;
	import com.gotchaslots.slots.data.lobby.lobbyMachine.base.SlotsBaseLobbyMachineData;
	import com.gotchaslots.slots.utils.consts.SlotsConsts;
	import com.milkmangames.nativeextensions.GVFacebookFriend;
	import com.milkmangames.nativeextensions.GVHttpMethod;
	import com.milkmangames.nativeextensions.GoViral;
	import com.milkmangames.nativeextensions.events.GVFacebookEvent;
	import com.milkmangames.nativeextensions.events.GVMailEvent;
	
	import flash.events.Event;
	
	public class SocialHandler extends EventDispatcherEx
	{
		// members
		private var _initialized:Boolean;
		
		private var _facebookConnected:Boolean;
		private var _facebookUid:String = "";
		private var _facebookName:String = "";
		private var _facebookAccessToken:String = "";
		
		// facebook connect
		public function get IsFacebookLogon():Boolean
		{
			return FacebookUid != "";
		}
		public function get FacebookUid():String
		{
			return _facebookUid;
		}
		public function set FacebookUid(value:String):void
		{
			if (_facebookUid != value)
			{
				_facebookUid = value;
				dispatchEvent(new SocialEvent(SocialEvent.FacebookLogonChanged));
			}
		}
		public function get FacebookName():String
		{
			return _facebookName;
		}
		public function get FacebookAccessToken():String
		{
			return _facebookAccessToken;
		}
		
		// class
		public function SocialHandler()
		{
			super();
			
			if (InitFacebookConnect())
			{
				_facebookConnected = GoViral.goViral.isFacebookAuthenticated();
				if (_facebookConnected)
				{
					GoViral.goViral.requestMyFacebookProfile();
				}
			}
			else
			{
				_facebookConnected = false;
			}
		}
		private function InitGoViral():Boolean
		{
			if (!_initialized)
			{
				if (GoViral.isSupported())
				{
					GoViral.create();
					
					_initialized = true;
				}
				else
				{
					_initialized = false;
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
				}
			}
			
			return _initialized;
		}
		
		// facebook
		private function InitFacebookConnect():Boolean
		{
			if (InitGoViral() && !_facebookConnected)
			{
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGGED_IN, OnLogEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGGED_OUT, OnLogEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGIN_CANCELED, OnLogEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_LOGIN_FAILED, OnLogEvent);
				
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_PUBLISH_PERMISSIONS_UPDATED, OnPermissionEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_PUBLISH_PERMISSIONS_FAILED, OnPermissionEvent);
				
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_REQUEST_RESPONSE, OnRequestEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_REQUEST_FAILED, OnRequestEvent);
				
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_DIALOG_FINISHED, OnDialogEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_DIALOG_CANCELED, OnDialogEvent);
				GoViral.goViral.addEventListener(GVFacebookEvent.FB_DIALOG_FAILED, OnDialogEvent);
				
				GoViral.goViral.addEventListener(GVMailEvent.MAIL_SENT, OnMailEvent);
				GoViral.goViral.addEventListener(GVMailEvent.MAIL_SAVED, OnMailEvent);
				GoViral.goViral.addEventListener(GVMailEvent.MAIL_CANCELED, OnMailEvent);
				GoViral.goViral.addEventListener(GVMailEvent.MAIL_FAILED, OnMailEvent);
				
				GoViral.goViral.initFacebook(SlotsConsts.FACEBOOK_APP_ID, "");
				
				_facebookConnected = true;
			}
			else
			{
				_facebookConnected = false;
				dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
			
			return _facebookConnected;
		}
		
		// login & logout
		public function Login():void
		{
			if (InitFacebookConnect())
			{
				if (GoViral.goViral.isFacebookAuthenticated())
				{
					GoViral.goViral.requestMyFacebookProfile();
				}
				else
				{
					GoViral.goViral.authenticateWithFacebook();
				}
			}
			else
			{
				dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
		public function Logout():void
		{
			if (_facebookConnected)
			{
				GoViral.goViral.logoutFacebook();
			}
			else
			{
				dispatchEvent(new SocialEvent(SocialEvent.FacebookLoggedOut));
			}
		}
		
		private function NumberToString(chips:Number, a:int, b:int):String
		{
			return chips.toString();
		}
		
		// shares
		public function ShareBomb():void
		{
			//Share("Gotcha Slots", "Bomb", _facebookName + " just won a Bomb in GotchaSlots", "Bomb.png", "ShareBomb");
		}
		public function ShareMiniSpin():void
		{
			//Share("Gotcha Slots", "MiniSpin", _facebookName + " just won a Mini Spin in GotchaSlots", "MiniSpin.png", "ShareMiniSpin");
		}
		public function ShareCollectible(png:String):void
		{
			//Share("Gotcha Slots", "Collectible", _facebookName + " just collected one more collectible in GotchaSlots", "Collectible.png", "ShareCollectible");
		}
		public function ShareMegaWin(chips:Number):void
		{
			//Share("Gotcha Slots", "MegaWin", _facebookName + " just won a Mega Win of " + NumberToString(chips, 2, 100) + " chips in GotchaSlots", "MegaWin.png", "ShareMegaWin");
		}
		public function ShareExtraBigWin(chips:Number):void
		{
			//Share("Gotcha Slots", "ExtraBigWin", _facebookName + " just won an Extra Big Win of " + NumberToString(chips, 2, 100) + " chips in GotchaSlots", "ExtraBigWin.png", "ShareExtraBigWin");
		}
		public function ShareBigWin(chips:Number):void
		{
			//Share("Gotcha Slots", "BigWin", _facebookName + " just won a Big Win of " + NumberToString(chips, 2, 100) + " chips in GotchaSlots", "BigWin.png", "ShareBigWin");
		}
		public function Share5InARow():void
		{
			//Share("Gotcha Slots", "5InARow", _facebookName + " just won 5 in a Row in GotchaSlots", "FiveInARow.png", "Share5InARow");
		}
		public function Share4InARow():void
		{
			//Share("Gotcha Slots", "4InARow", _facebookName + " just won 4 in a Row in GotchaSlots", "FourInARow.png", "Share4InARow");
		}
		public function ShareBonusGame(chips:Number):void
		{
			Share("Gotcha Slots", "BonusGame", _facebookName + " just won a Bonus Game of " + NumberToString(chips, 2, 100) + " chips in GotchaSlots", "BonusGame.png", "ShareBonusGame");
		}
		public function ShareMultiplier(chips:Number):void
		{
			//Share("Gotcha Slots", "Multiplier", _facebookName + " just won " + NumberToString(chips, 2, 100) + " chips with Multiplier symbols in GotchaSlots", "Multiplier.png", "ShareMultiplier");
		}
		public function ShareFreeSpins(freeSpins:int):void
		{
			Share("Gotcha Slots", "FreeSpins", _facebookName + " just won " + freeSpins + " Free Spins in GotchaSlots", "FreeSpins.png", "ShareFreeSpins");
		}
		public function ShareJackpot(chips:Number):void
		{
			Share("Gotcha Slots", "Jackpot", _facebookName + " just won a Jackpot of " + NumberToString(chips, 2, 100) + " chips in GotchaSlots", "Jackpot.png", "ShareJackpot");
		}
		public function ShareNewMachine(lobbyMachine:SlotsBaseLobbyMachineData):void
		{
			Share("Gotcha Slots", "NewMachine", _facebookName + " just opened a new machine in GotchaSlots", lobbyMachine.Symbols.ServerSymbolFileName, "ShareNewMachine");
		}
		public function ShareLevelUp():void
		{
			//Share("Gotcha Slots", "LevelUp", _facebookName + " just reached a new level in GotchaSlots", "LevelUp.png", "ShareLevelUp");
		}
		
		private function Share(caption:String, type:String, description:String, image:String, reference:String):void
		{
			if (Main.Instance.Session.Rare.AllowShare)
			{
				if (InitFacebookConnect())
				{
					var linkUrl:String = Main.Instance.Device.DeviceType == DeviceTypeEnum.IPHONE ? SlotsConsts.APPLE_ITUNES_APP_URL : SlotsConsts.GOOGLE_PLAY_APP_URL;
					var imageUrl:String = "http://www.GotchaSlots.com/Res/Share/" + image;
					
					var actions:Object = new Object();
					actions.name = "Get Free Chips";
					actions.link = linkUrl;
					var extraParams:Object = new Object();
					extraParams.actions = actions;
					extraParams.ref = reference;
					var extraParamsJson:String = new JSONEncoder(extraParams).getString();
					
					var params:Object = new Object();
					params.caption = caption;
					params.name = caption;
					params.description = description;
					params.link = linkUrl;
					params.picture = imageUrl;
					params.actions = actions;
					params.ref = reference;
					
					GoViral.goViral.facebookGraphRequest("me/feed", GVHttpMethod.POST, params, "publish_actions");
					Main.Instance.XServices.GoogleAnalytics.TrackShare(reference);
				}
				else
				{
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
				}
			}
		}
		
		public function Invite():void
		{
			if (InitFacebookConnect())
			{
				GoViral.goViral.showFacebookRequestDialog(_facebookName + " join me and play GotchaSlots", "Gotcha Slots");
			}
			else
			{
				dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
		
		// email
		public function SendEmail(subject:String, toWhom:String, body:String):void
		{
			if (InitGoViral() && GoViral.goViral.isEmailAvailable())
			{
				GoViral.goViral.showEmailComposer(subject, toWhom, body, true);
			}
			else
			{
				dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
		
		// events
		private function OnLogEvent(event:GVFacebookEvent):void
		{
			switch(event.type)
			{
				case GVFacebookEvent.FB_LOGGED_IN:
					GoViral.goViral.requestMyFacebookProfile();
					break;
				case GVFacebookEvent.FB_LOGGED_OUT:
					FacebookUid = "";
					_facebookAccessToken = "";
					Main.Instance.XServices.GoogleAnalytics.TrackLogout();
					dispatchEvent(new SocialEvent(SocialEvent.FacebookLoggedOut));
					break;
				case GVFacebookEvent.FB_LOGIN_CANCELED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				case GVFacebookEvent.FB_LOGIN_FAILED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				default:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
		private function OnPermissionEvent(event:Event):void
		{
			switch(event.type)
			{
				case GVFacebookEvent.FB_PUBLISH_PERMISSIONS_UPDATED:
					GoViral.goViral.facebookGraphRequest("me/permissions");
					break;
				case GVFacebookEvent.FB_PUBLISH_PERMISSIONS_FAILED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				default:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
		private function OnRequestEvent(event:GVFacebookEvent):void
		{
			switch(event.type)
			{
				case GVFacebookEvent.FB_REQUEST_RESPONSE:
					if (event.friends == null)
					{
						dispatchEvent(new SocialEvent(SocialEvent.Failed));
					}
					else
					{
						switch (event.graphPath)
						{
							case "me":
								var gvFacebookFriend:GVFacebookFriend = event.friends[0];
								FacebookUid = gvFacebookFriend.id;
								_facebookName = gvFacebookFriend.name;
								_facebookAccessToken = GoViral.goViral.getFbAccessToken();
								Main.Instance.XServices.GoogleAnalytics.TrackLogin();
								dispatchEvent(new SocialEvent(SocialEvent.FacebookLoggedIn));
								break;
							case "me/feed":
								dispatchEvent(new SocialEvent(SocialEvent.FeedShareRequestComplete));
								break;
							default:
								dispatchEvent(new SocialEvent(SocialEvent.Failed));
						}
					}
					break;
				case GVFacebookEvent.FB_REQUEST_FAILED:
					if (event.graphPath && event.graphPath != "me/feed")
					{
						dispatchEvent(new SocialEvent(SocialEvent.Failed));
					}
					break;
				default:
					if (event.graphPath && event.graphPath != "me/feed")
					{
						dispatchEvent(new SocialEvent(SocialEvent.Failed));
					}
			}
		}
		private function OnDialogEvent(event:GVFacebookEvent):void
		{
			switch(event.type)
			{
				case GVFacebookEvent.FB_DIALOG_FINISHED:
					switch (event.dialogType)
					{
						case "apprequests":
							if (event && event.data)
							{
								/*
								// invite friends dialog response
								"event"	com.milkmangames.nativeextensions.events.GVFacebookEvent (@55504be1)	
								bubbles	false	
								cancelable	false	
								currentTarget	com.milkmangames.nativeextensions.GoViral (@525e1d41)	
								data	Object (@58519ca1)	
								request	"323728024435103"	
								to[0]	"808792371"	
								to[1]	"100006733410029"	
								to[2]	"100001314428337"	
								_data	Object (@58519ca1)	
								request	"323728024435103"	
								to[0]	"808792371"	
								to[1]	"100006733410029"	
								to[2]	"100001314428337"	
								dialogType	"apprequests"	
								errorCode	0	
								errorMessage	null	
								eventPhase	2	
								facebookErrorCategoryId	0	
								facebookUserErrorMessage	null	
								friends	__AS3__.vec.Vector.<com.milkmangames.nativeextensions::GVFacebookFriend> (@585944e9)	
								[inherited]	
								fixed	false	
								length	0	
								graphPath	null	
								graphPathQuery	null	
								jsonData	"{"to[1]":"100006733410029","to[2]":"100001314428337","to[0]":"808792371","request":"323728024435103"}"	
								permissions	null	
								shouldNotifyFacebookUser	false	
								target	com.milkmangames.nativeextensions.GoViral (@525e1d41)	
								extContext	flash.external.ExtensionContext (@526740f9)	
								facebookAppId	"164688810385291"	
								isFacebookInitialized	true	
								lastServiceType	null	
								logCallback	null	
								type	"gvFbDialogFinished"	
								*/
								
								var json:String = event.jsonData;
								json = json.replace("{", "");
								json = json.replace("}", "");
								json = StringHelper.ReplaceAll(json, "\"", "");
								
								var items:Array = json.split(",");
								
								var ids:Vector.<String> = new Vector.<String>();
								while (items.length > 0)
								{
									var item:String = items.pop();
									
									if (item.indexOf("request") == -1)
									{
										var id:Array = item.split(":");
										ids.push(id[1]);
									}
								}
								
								Main.Instance.XServices.GoogleAnalytics.TrackInvite(ids.length);
								dispatchEvent(new SocialEvent(SocialEvent.InviteFriendsDialogComplete, ids)); 
							}
							else
							{
								dispatchEvent(new SocialEvent(SocialEvent.Failed));
							}
							break;
						default:
							dispatchEvent(new SocialEvent(SocialEvent.Failed));
							break;
					}
					break;
				case GVFacebookEvent.FB_DIALOG_CANCELED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				case GVFacebookEvent.FB_DIALOG_FAILED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				default:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
		protected function OnMailEvent(event:Event):void
		{
			switch(event.type)
			{
				case GVMailEvent.MAIL_SENT:
					dispatchEvent(new SocialEvent(SocialEvent.MailSent));
					break;
				case GVMailEvent.MAIL_SAVED:
					dispatchEvent(new SocialEvent(SocialEvent.MailSaved));
					break;
				case GVMailEvent.MAIL_CANCELED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				case GVMailEvent.MAIL_FAILED:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
					break;
				default:
					dispatchEvent(new SocialEvent(SocialEvent.Failed));
			}
		}
	}
}