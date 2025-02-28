﻿package idv.cjcat.stardust.twoD.initializers {
	import idv.cjcat.stardust.common.initializers.Alpha;
	import idv.cjcat.stardust.common.initializers.CollisionRadius;
	import idv.cjcat.stardust.common.initializers.CompositeInitializer;
	import idv.cjcat.stardust.common.initializers.Initializer;
	import idv.cjcat.stardust.common.initializers.InitializerCollection;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.initializers.Mask;
	import idv.cjcat.stardust.common.initializers.Mass;
	import idv.cjcat.stardust.common.initializers.Scale;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.sd;
	import idv.cjcat.stardust.twoD.geom.Vec2D;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	import idv.cjcat.stardust.twoD.zones.Zone;
	
	/**
	 * This is a wrapper class of several common and useful initializers. 
	 * As it's name suggests, you can use this class whenever you're too lazy to create initializers one by one.
	 * You don't directly control these component initializers; 
	 * instead, you use the abstract properties provided by this class.
	 *  
	 * <p>
	 * This composite initializer is consisted of the folling actions:
	 * <ul>
	 * <li>DisplayObjectClass</li>
	 * <li>Position</li>
	 * <li>Rotation</li>
	 * <li>Velocity</li>
	 * <li>Omega</li>
	 * <li>Scale</li>
	 * <li>Mass</li>
	 * <li>Mask</li>
	 * <li>CollisionRadius</li>
	 * <li>Alpha</li>
	 * </ul>
	 * </p>
	 */
	public class LazyInitializer extends CompositeInitializer {
		
		private var _posInit:Position;
		
		private var _rotationInit:Rotation;
		private var _rotationInitRand:UniformRandom;
		
		private var _displayObjectClassInit:DisplayObjectClass;
		private var _displayObjectClassParams:Array;
		
		private var _lifeInit:Life;
		private var _lifeInitRand:UniformRandom;
		
		private var _velocityInit:Velocity;
		private var _velocityInitSector:LazySectorZone;
		
		private var _omegaInit:Omega;
		private var _omegaInitRand:UniformRandom;
		
		private var _inScaleit:Scale;
		private var _inScaleitRand:UniformRandom;
		
		private var _massInit:Mass;
		private var _massInitRand:UniformRandom;
		private var _maskInit:Mask;
		private var _collisionRadiusInit:CollisionRadius;
		
		private var _alphaInit:Alpha;
		private var _alphaInitRand:UniformRandom;
		
		public function LazyInitializer(displayObjectClass:Class = null, positionArea:Zone = null) {
			if (!positionArea) positionArea = new SinglePoint();
			
			_displayObjectClassInit = new DisplayObjectClass(displayObjectClass);
			
			_posInit = new Position(positionArea);
			
			_rotationInitRand = new UniformRandom(0, 180);
			_rotationInit = new Rotation(_rotationInitRand);
			
			_lifeInitRand = new UniformRandom(50, 0);
			_lifeInit = new Life(_lifeInitRand);
			
			_velocityInitSector = new LazySectorZone(3, 0);
			_velocityInitSector.direction.set(0, -1);
			_velocityInit = new Velocity(_velocityInitSector);
			
			_omegaInitRand = new UniformRandom(0, 0);
			_omegaInit = new Omega(_omegaInitRand);
			
			_inScaleitRand = new UniformRandom(1, 0);
			_inScaleit = new Scale(_inScaleitRand);
			
			_massInitRand = new UniformRandom(1, 0);
			_massInit = new Mass(_massInitRand);
			_maskInit = new Mask(1);
			_collisionRadiusInit = new CollisionRadius(0);
			
			_alphaInitRand = new UniformRandom(1, 0);
			_alphaInit = new Alpha(_alphaInitRand);
			
			superAddInitializer(_displayObjectClassInit);
			superAddInitializer(_posInit);
			superAddInitializer(_rotationInit);
			superAddInitializer(_lifeInit);
			superAddInitializer(_velocityInit);
			superAddInitializer(_omegaInit);
			superAddInitializer(_inScaleit);
			superAddInitializer(_massInit);
			superAddInitializer(_maskInit);
			superAddInitializer(_collisionRadiusInit);
			superAddInitializer(_alphaInit);
		}
		
		public function get displayObjectClass():Class { return _displayObjectClassInit.displayObjectClass; }
		public function set displayObjectClass(value:Class):void {
			_displayObjectClassInit.displayObjectClass = value;
		}
		
		public function get displayObjectClassParams():Array { return _displayObjectClassInit.constructorParams; }
		public function set displayObjectClassParams(value:Array):void {
			_displayObjectClassInit.constructorParams = value;
		}
		
		/**
		 * Position zone.
		 */
		public function get position():Zone { return _posInit.zone; }
		public function set position(value:Zone):void {
			_posInit.zone = value;
		}
		
		/**
		 * Average rotation.
		 */
		public function get rotation():Number { return _rotationInitRand.center; }
		public function set rotation(value:Number):void {
			_rotationInitRand.center = value;
		}
		
		/**
		 * Rotation variation.
		 */
		public function get rotationVar():Number { return _rotationInitRand.radius; }
		public function set rotationVar(value:Number):void {
			_rotationInitRand.radius = value;
		}
		
		/**
		 * Average life.
		 */
		public function get life():Number { return _lifeInitRand.center; }
		public function set life(value:Number):void {
			_lifeInitRand.center = value;
		}
		
		/**
		 * Life variation.
		 */
		public function get lifeVar():Number { return _lifeInitRand.radius; }
		public function set lifeVar(value:Number):void {
			_lifeInitRand.radius = value;
		}
		
		/**
		 * Average speed.
		 */
		public function get speed():Number { return _velocityInitSector.radius; }
		public function set speed(value:Number):void {
			_velocityInitSector.radius = value;
		}
		
		/**
		 * Speed variation.
		 */
		public function get speedVar():Number { return _velocityInitSector.radiusVar; }
		public function set speedVar(value:Number):void {
			_velocityInitSector.radiusVar = value;
		}
		
		/**
		 * Average direction.
		 */
		public function get direction():Vec2D { return _velocityInitSector.direction; }
		
		/**
		 * Direction variation, in degrees.
		 */
		public function get directionVar():Number { return _velocityInitSector.directionVar; }
		public function set directionVar(value:Number):void {
			_velocityInitSector.directionVar = value;
		}
		
		/**
		 * Average omega (angular velocity).
		 */
		public function get omega():Number { return _omegaInitRand.center; }
		public function set omega(value:Number):void {
			_omegaInitRand.center = value;
		}
		
		/**
		 * Omega variation.
		 */
		public function get omegaVar():Number { return _omegaInitRand.radius; }
		public function set omegaVar(value:Number):void {
			_omegaInitRand.radius = value;
		}
		
		/**
		 * Average scale.
		 */
		public function get scale():Number { return _inScaleitRand.center; }
		public function set scale(value:Number):void {
			_inScaleitRand.center = value;
		}
		
		/**
		 * Scale variation.
		 */
		public function get scaleVar():Number { return _inScaleitRand.radius; }
		public function set scaleVar(value:Number):void {
			_inScaleitRand.radius = value;
		}
		
		/**
		 * Average mass.
		 */
		public function get mass():Number { return _massInitRand.center; }
		public function set mass(value:Number):void {
			_massInitRand.center = value;
		}
		
		/**
		 * Mass variation.
		 */
		public function get massVar():Number { return _massInitRand.radius; }
		public function set massVar(value:Number):void {
			_massInitRand.radius = value;
		}
		
		/**
		 * Particle mask value.
		 */
		public function get mask():int { return _maskInit.mask; }
		public function set mask(value:int):void {
			_maskInit.mask = value;
		}
		
		/**
		 * Particle collision radius.
		 */
		public function get collisionRadius():Number { return _collisionRadiusInit.radius; }
		public function set collisionRadius(value:Number):void {
			_collisionRadiusInit.radius = value;
		}
		
		/**
		 * Average alpha.
		 */
		public function get alpha():Number { return _alphaInitRand.center; }
		public function set alpha(value:Number):void {
			_alphaInitRand.center = value;
		}
		
		/**
		 * Alpha variation.
		 */
		public function get alphaVar():Number { return _alphaInitRand.radius; }
		public function set alphaVar(value:Number):void {
			_alphaInitRand.radius = value;
		}
		
		
		//additional initializers
		//------------------------------------------------------------------------------------------------
		
		protected function superAddInitializer(initializer:Initializer):void {
			super.addInitializer(initializer);
		}
		
		private var additionalInitializers:InitializerCollection = new InitializerCollection();
		public override function addInitializer(initializer:Initializer):void {
			super.addInitializer(initializer);
			additionalInitializers.addInitializer(initializer);
		}
		
		public override function removeInitializer(initializer:Initializer):void {
			super.removeInitializer(initializer);
			additionalInitializers.removeInitializer(initializer);
		}
		
		public override function clearInitializers():void {
			super.clearInitializers();
			additionalInitializers.clearInitializers();
		}
		
		//------------------------------------------------------------------------------------------------
		//end of additional initializers
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [position].concat(additionalInitializers.sd::initializers);
		}
		
		public override function getXMLTagName():String {
			return "LazyInitializer";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			delete xml.initializers;
			
			xml.@position = position.name;
			xml.@rotation = rotation;
			xml.@rotationVar = rotationVar;
			xml.@life = life;
			xml.@lifeVar = lifeVar;
			xml.@speed = speedVar;
			xml.@speedVar = speedVar;
			xml.@directionX = direction.x;
			xml.@directionY = direction.y;
			xml.@omega = omega;
			xml.@omegaVar = omegaVar;
			xml.@scale = scale;
			xml.@scaleVar = scaleVar;
			xml.@mass = mass;
			xml.@mask = mask;
			xml.@collisionRadius = collisionRadius;
			xml.@alpha = alpha;
			xml.@alphaVar = alphaVar;
			
			if (additionalInitializers.sd::initializers.length > 0) {
				xml.appendChild(<initializers/>);
				var initializer:Initializer;
				for each (initializer in additionalInitializers.sd::initializers) {
					xml.initializers.appendChild(initializer.getXMLTag());
				}
			}
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			name = xml.@name;
			active = (xml.@active == "true");
			//mask = parseInt(xml.@mask);
			
			if (xml.@position.length()) position = builder.getElementByName(xml.@position) as Zone;
			if (xml.@rotation.length()) rotation = parseFloat(xml.@rotation);
			if (xml.@rotationVar.length()) rotationVar = parseFloat(xml.@rotationVar);
			if (xml.@life.length()) life = parseFloat(xml.@life);
			if (xml.@lifeVar.length()) lifeVar = parseFloat(xml.@lifeVar);
			if (xml.@directionX.length()) direction.x = parseFloat(xml.@directionX);
			if (xml.@directionY.length()) direction.y = parseFloat(xml.@directionY);
			if (xml.@omega.length()) omega = parseFloat(xml.@omega);
			if (xml.@omegaVar.length()) omegaVar = parseFloat(xml.@omegaVar);
			if (xml.@scale.length()) scale = parseFloat(xml.@scale);
			if (xml.@scaleVar.length()) scaleVar = parseFloat(xml.@scaleVar);
			if (xml.@mask.length()) mask = parseInt(xml.@mask);
			if (xml.@mass.length()) mass = parseFloat(xml.@mass);
			if (xml.@collisionRadius.length()) collisionRadius = parseFloat(xml.@collisionRadius);
			if (xml.@alpha.length()) alpha = parseFloat(xml.@alpha);
			if (xml.@alphaVar.length()) alphaVar = parseFloat(xml.@alphaVar);
			
			additionalInitializers.clearInitializers();
			for each (var node:XML in xml.initializers.*) {
				addInitializer(builder.getElementByName(node.@name) as Initializer);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}