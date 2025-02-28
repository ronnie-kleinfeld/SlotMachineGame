﻿package idv.cjcat.stardust.twoD.actions {
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
	import idv.cjcat.stardust.twoD.geom.Vec2D;
	import idv.cjcat.stardust.twoD.geom.Vec2DPool;
	import idv.cjcat.stardust.twoD.particles.Particle2D;
	import idv.cjcat.stardust.twoD.particles.PooledParticle2DFactory;
	
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
	public class Spawn extends Action2D implements InitializerCollector {
		
		public var inheritDirection:Boolean;
		public var inheritVelocity:Boolean;
		private var _countRandom:Random;
		private var _factory:PooledParticle2DFactory;

		public function Spawn(count:Random = null, inheritDirection:Boolean = true, inheritVelocity:Boolean = false) {
			this.inheritDirection = inheritDirection;
			this.inheritVelocity = inheritVelocity;
			this.countRandom = count;
			_factory = new PooledParticle2DFactory();
		}
		
		private var p2D:Particle2D;
		private var particles:ParticleCollection;
		private var p:Particle2D;
		private var iter:ParticleIterator;
		private var v:Vec2D;
		public override function update(emitter:Emitter, particle:Particle, time:Number):void {
			p2D = Particle2D(particle);
			particles = _factory.createParticles(StardustMath.randomFloor(_countRandom.random()));
			iter = particles.getIterator();
			while (p = Particle2D(iter.particle())) {
				p.x += p2D.x;
				p.y += p2D.y;
				if (inheritVelocity) {
					p.vx += p2D.vx;
					p.vy += p2D.vy;
				}
				if (inheritDirection) {
					v = Vec2DPool.get(p.vx, p.vy);
					v.rotateThis(Math.atan2(p2D.vx, -p2D.vy), true);
					p.vx = v.x;
					p.vy = v.y;
					Vec2DPool.recycle(v);
				}
				iter.next();
			}
			
			emitter.addParticles(particles);
		}
		
		/**
		 * Adds an initializer to the spawning action.
		 * @param	initializer
		 */
		public function addInitializer(initializer:Initializer):void {
			_factory.addInitializer(initializer);
		}
		
		/**
		 * Removes an initializer from the spawning action.
		 * @param	initializer
		 */
		public function removeInitializer(initializer:Initializer):void {
			_factory.removeInitializer(initializer);
		}
		
		/**
		 * Removes all initializers from the spawning action.
		 */
		public function clearInitializers():void {
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
			return "Spawn";
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