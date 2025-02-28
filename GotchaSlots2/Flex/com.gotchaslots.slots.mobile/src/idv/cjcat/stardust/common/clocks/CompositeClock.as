﻿package idv.cjcat.stardust.common.clocks {
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.sd;
	
	/**
	 * This clock is a group of clocks. 
	 */
	public class CompositeClock extends Clock implements ClockCollector {
		
		protected var clockCollection:ClockCollection;
		
		public function CompositeClock() {
			clockCollection = new ClockCollection();
		}
		
		/**
		 * The return value is the sum of all component clocks' return values of the <code>getTicks()</code> method.
		 * @param	time
		 * @return
		 */
		public override final function getTicks(time:Number):int {
			var sum:int = 0;
			for each (var clock:Clock in clockCollection.sd::clocks) {
				sum += clock.getTicks(time);
			}
			return sum;
		}
		
		/**
		 * Adds a clock to the group.
		 * @param	clock
		 */
		public final function addClock(clock:Clock):void {
			clockCollection.addClock(clock);
		}
		
		/**
		 * Removes a clock from the group.
		 * @param	clock
		 */
		public final function removeClock(clock:Clock):void {
			clockCollection.removeClock(clock);
		}
		
		/**
		 * Removes all clocks from the group.
		 */
		public final function clearClocks():void {
			clockCollection.clearClocks();
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return clockCollection.sd::clocks.concat();
		}
		
		public override function getXMLTagName():String {
			return "CompositeClock";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			if (clockCollection.sd::clocks.length > 0) {
				xml.appendChild(<clocks/>);
				var clock:Clock;
				for each (clock in clockCollection.sd::clocks) {
					xml.clocks.appendChild(clock.getXMLTag());
				}
			}
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			clearClocks();
			for each (var node:XML in xml.clocks.*) {
				addClock(builder.getElementByName(node.@name) as Clock);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}