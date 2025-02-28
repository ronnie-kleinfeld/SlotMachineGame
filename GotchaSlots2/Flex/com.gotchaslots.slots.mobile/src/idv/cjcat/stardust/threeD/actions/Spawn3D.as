﻿package idv.cjcat.stardust.threeD.actions {
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.initializers.Initializer;
	import idv.cjcat.stardust.common.initializers.InitializerCollector;
	import idv.cjcat.stardust.common.math.Random;
	import idv.cjcat.stardust.common.math.StardustMath;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	import idv.cjcat.stardust.sd;
	import idv.cjcat.stardust.threeD.geom.Vec3D;
	import idv.cjcat.stardust.threeD.geom.Vec3DPool;
	import idv.cjcat.stardust.threeD.particles.Particle3D;
	import idv.cjcat.stardust.threeD.particles.Particle3DFactory;
	
	/**
	 * Spawns new particles at the position of existing particles.
	 * 
	 * <p>
	 * This action can be used to create effects such as fireworks, rocket trails, etc.
	 * </p>
	 * 
	 * <p>
	 * Newly spawned particles are initialized by initializers added to the spawning process through the <code>addInitializer()</code> method.
	 * </p>
	 */
	public class Spawn3D extends Action3D implements InitializerCollector {
		
		public var inheritDirection:Boolean;
		public var inheritVelocity:Boolean;
		private var _countRandom:Random;
		private var _factory:Particle3DFactory;

		public function Spawn3D(count:Random = null, inheritDirection:Boolean = true, inheritVelocity:Boolean = false) {
			this.inheritDirection = inheritDirection;
			this.inheritVelocity = inheritVelocity;
			this.countRandom = count;
			_factory = new Particle3DFactory();
		}
		
		private var p3D:Particle3D;
		private var particles:ParticleCollection;
		private var p:Particle3D;
		private var iter:ParticleIterator;
		private var v:Vec3D;
		public override final function update(emitter:Emitter, particle:Particle, time:Number):void {
			p3D = Particle3D(particle);
			particles = _factory.createParticles(StardustMath.randomFloor(_countRandom.random()));
			iter = particles.getIterator();
			while (p = Particle3D(iter.particle())) {
				p.x += p3D.x;
				p.y += p3D.y;
				p.z += p3D.z;
				if (inheritVelocity) {
					p.vx += p3D.vx;
					p.vy += p3D.vy;
					p.vz += p3D.vz;
				}
				if (inheritDirection) {
					v = Vec3DPool.get(p.vx, p.vy, p.vz);
					
					v.rotateXThis(Math.atan2(Math.sqrt(p3D.vx * p3D.vx + p3D.vz * p3D.vz), -p3D.vy), true);
					v.rotateYThis(Math.atan2( -p3D.vz, p3D.vx) - StardustMath.HALF_PI, true);
					
					p.vx = v.x;
					p.vy = v.y;
					p.vz = v.z;
					Vec3DPool.recycle(v);
				}
				
				iter.next();
			}
			emitter.addParticles(particles);
		}
		
		/**
		 * Adds an initializer to the spawning action.
		 * @param	initializer
		 */
		public final function addInitializer(initializer:Initializer):void {
			_factory.addInitializer(initializer);
		}
		
		/**
		 * Removes an initializer from the spawning action.
		 * @param	initializer
		 */
		public final function removeInitializer(initializer:Initializer):void {
			_factory.removeInitializer(initializer);
		}
		
		/**
		 * Removes all initializers from the spawning action.
		 */
		public final function clearInitializers():void {
			_factory.clearInitializers();
		}
		
		/**
		 * The <code>Random</code> object that determines how many particles to spawn each time.
		 */
		public function get countRandom():Random { return _countRandom; }
		public function set countRandom(value:Random):void {
			if (!value) value = new UniformRandom(0, 0);
			_countRandom = value;
		}
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getRelatedObjects():Array {
			return [_countRandom].concat(_factory.sd::initializerCollection.sd::initializers);
		}
		
		public override function getXMLTagName():String {
			return "Spawn3D";
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@inheritDirection = inheritDirection;
			xml.@inheritVelocity = inheritVelocity;
			xml.@countRandom = _countRandom.name;
			
			if (_factory.sd::initializerCollection.sd::initializers.length > 0) {
				xml.appendChild(<initializers/>);
				var initializer:Initializer;
				for each (initializer in _factory.sd::initializerCollection.sd::initializers) {
					xml.initializers.appendChild(initializer.getXMLTag());
				}
			}
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@inheritDirection.length()) inheritDirection = (xml.@inheritDirection == "true");
			if (xml.@inheritVelocity.length()) inheritVelocity = (xml.@inheritVelocity == "true");
			if (xml.@countRandom.length()) countRandom = builder.getElementByName(xml.@countRandom) as Random;
			
			clearInitializers();
			for each (var node:XML in xml.initializers.*) {
				addInitializer(builder.getElementByName(node.@name) as Initializer);
			}
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}