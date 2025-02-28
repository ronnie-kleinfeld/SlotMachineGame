﻿package idv.cjcat.stardust.common.initializers {
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.utils.WeightedCollection;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * This initializer chooses among different initializers randomly according to each initializer's weight.
	 */
	public class SwitchInitializer extends Initializer {
		
		private var collection:WeightedCollection;
		
		/**
		 * 
		 * @param	initializers	The initializers to choose from.
		 * @param	weights			The initializers' probability weights.
		 */
		public function SwitchInitializer(initializers:Array = null, weights:Array = null) {
			if ((!initializers) || (!weights)) {
				initializers = [];
				weights = [];
			}
			
			setInitializers(initializers, weights);
		}
		
		public function setInitializers(initializers:Array, weights:Array):void {
			collection = new WeightedCollection(initializers, weights);
		}
		
		public override final function initialize(particle:Particle):void {
			var initializer:Initializer = collection.get() as Initializer;
			initializer.initialize(particle);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return collection.contents;
		}
		
		public override function getXMLTagName():String {
			return "SwitchInitializer";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			var initializers:Array = collection.contents;
			if (initializers.length > 0) {
				var weights:Array = collection.weights;
				
				xml.appendChild(<initializers/>);
				for (var i:int = 0; i < initializers.length; i++) {
					var node:XML = Initializer(initializers[i]).getXMLTag();
					node.@weight = weights[i];
					xml.initializers.appendChild(node);
				}
			}
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			collection.clear();
			for each (var node:XML in xml.initializers.*) {
				var initializer:Initializer = builder.getElementByName(node.@name) as Initializer;
				var weight:Number = parseFloat(node.@weight);
				collection.addContent(initializer, weight);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}