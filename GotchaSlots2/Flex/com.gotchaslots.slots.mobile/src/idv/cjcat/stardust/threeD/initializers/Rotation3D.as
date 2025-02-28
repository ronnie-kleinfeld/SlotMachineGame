﻿package idv.cjcat.stardust.threeD.initializers {
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	
	/**
	 * Sets a particle's rotation value, in degrees, based on the <code>randomX</code>, <code>randomY</code>, and <code>randomZ</code> properties.
	 */
	public class Rotation3D extends Initializer3D {
		
		private var _randomX:Random;
		private var _randomY:Random;
		private var _randomZ:Random;
		public function Rotation3D(randomX:Random = null, randomY:Random = null, randomZ:Random = null) {
			this.randomX = randomX;
			this.randomY = randomY;
			this.randomZ = randomZ;
		}
		
		public override final function initialize(particle:Particle):void {
			var p3D:Particle3D = Particle3D(particle);
			p3D.rotationX = randomX.random();
			p3D.rotationY = randomY.random();
			p3D.rotationZ = randomZ.random();
		}
		
		public function get randomX():Random { return _randomX; }
		public function set randomX(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_randomX = value;
		}
		
		public function get randomY():Random { return _randomY; }
		public function set randomY(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_randomY = value;
		}
		
		public function get randomZ():Random { return _randomZ; }
		public function set randomZ(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_randomZ = value;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_randomX, _randomY, _randomZ];
		}
		
		public override function getXMLTagName():String {
			return "Rotation3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@randomX = _randomX.name;
			xml.@randomY = _randomY.name;
			xml.@randomZ = _randomZ.name;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@randomX.length()) randomX = builder.getElementByName(xml.@randomX) as Random;
			if (xml.@randomY.length()) randomY = builder.getElementByName(xml.@randomY) as Random;
			if (xml.@randomZ.length()) randomZ = builder.getElementByName(xml.@randomZ) as Random;
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}