﻿package idv.cjcat.stardust.twoD.fields {
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.twoD.geom.MotionData2D;
	import idv.cjcat.stardust.twoD.geom.MotionData2DPool;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	
	/**
	 * Uniform vector field. It yields a <code>MotionData2D</code> object of same X and Y components no matter what.
	 * 
	 * <p>
	 * This can be used to simulate uniform gravity.
	 * </p>
	 */
	public class UniformField extends Field {
		
		/**
		 * The X component of the returned <code>MotionData2D</code> object.
		 */
		public var x:Number;
		/**
		 * The Y component of the returned <code>MotionData2D</code> object.
		 */
		public var y:Number;
		
		public function UniformField(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		protected override function calculateMotionData2D(particle:Particle2D):MotionData2D {
			return MotionData2DPool.get(x, y);
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "UniformField";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@x = x;
			xml.@y = y;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@x.length()) x = parseFloat(xml.@x);
			if (xml.@y.length()) y = parseFloat(xml.@y);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}