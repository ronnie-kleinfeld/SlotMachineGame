﻿package idv.cjcat.stardust.common.math {
	import idv.cjcat.stardust.common.StardustElement;
	
	/**
	 * This class generates a random number.
	 */
	public class Random extends StardustElement {
		
		/**
		 * [Abstract Method] Generates a random number.
		 * @return
		 */
		public function random():Number {
			//abstract method
			return 0.5;
		}
		
		/**
		 * [Abstract Method] Sets the random number's range.
		 * @param	lowerBound
		 * @param	upperBound
		 */
		public function setRange(lowerBound:Number, upperBound:Number):void {
			//abstract method
		}
		
		/**
		 * [Abstract Method] Returns the random number's range.
		 * @return
		 */
		public function getRange():Array {
			//abstract method
			return [0.5, 0.5];
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Random";
		}
		
		public override function getElementTypeXMLTag():XML {
			return <randoms/>;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}