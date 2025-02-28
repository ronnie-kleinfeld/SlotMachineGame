﻿package idv.cjcat.stardust.threeD.actions.triggers {
	import idv.cjcat.stardust.common.actions.triggers.ActionTrigger;
	import idv.cjcat.stardust.threeD.actions.Action3DPriority;
	
	/**
	 * Base class for 3D action triggers.
	 */
	public class ActionTrigger3D extends ActionTrigger {
		
		public function ActionTrigger3D() {
			_supports2D = false;
			
			priority = Action3DPriority.getInstance().getPriority(Object(this).constructor as Class);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "ActionTrigger3D";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}