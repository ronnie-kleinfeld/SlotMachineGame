﻿package idv.cjcat.stardust.common.actions {
	import idv.cjcat.signals.ISignal;
	import idv.cjcat.signals.Signal;
	import idv.cjcat.stardust.common.emitters.Emitter;
	import idv.cjcat.stardust.common.particles.Particle;
	import idv.cjcat.stardust.common.particles.ParticleCollection;
	import idv.cjcat.stardust.common.particles.ParticleIterator;
	import idv.cjcat.stardust.common.StardustElement;
	import idv.cjcat.stardust.common.xml.XMLBuilder;
	
	/**
	 * An action is used to continuously update a particle's property.
	 * 
	 * <p>
	 * An action is associated with an emitter. On each <code>Emitter.step()</code> method call, 
	 * the action's <code>update()</code> method is called with each particles in the emitter passed in as parameter. 
	 * This method updates a particles property, such as changing the particle's position according to its velocity, 
	 * or modifying the particle's velocity based on gravity fields.
	 * </p>
	 * 
	 * <p>
	 * Default priority = 0;
	 * </p>
	 */
	public class Action extends StardustElement {
		
		
		//signals
		//------------------------------------------------------------------------------------------------
		
		private var _onPriorityChange:ISignal = new Signal(Action);
		/**
		 * Dispatched when the action's priority is changed.
		 * <p/>
		 * Signature: (action:Action)
		 */
		public function get onPriorityChange():ISignal { return _onPriorityChange; }
		
		private var _onAdd:ISignal = new Signal(Emitter, Action);
		/**
		 * Dispatched when the added to an emitter.
		 * <p/>
		 * Signature: (emitter:Emitter, action:Action)
		 */
		public function get onAdd():ISignal { return _onAdd; }
		
		private var _onRemove:ISignal = new Signal(Emitter, Action);
		/**
		 * Dispatched when the removed from an emitter.
		 * <p/>
		 * Signature: (emitter:Emitter, action:Action)
		 */
		public function get onRemove():ISignal { return _onRemove; }
		
		//------------------------------------------------------------------------------------------------
		//end of signals
		
		
		/**
		 * Denotes if the action is active, true by default.
		 */
		public var active:Boolean;
		
		/**
		 * Reset to false on each emitter step. 
		 * If set to true in a <code>update()</code> method call, 
		 * this action is skipped by the emitter during that emitter step.
		 */
		public var skipThisAction:Boolean;
		
		private var _mask:int;
		private var _priority:int;
		
		/** @private */
		protected var _supports2D:Boolean;
		/** @private */
		protected var _supports3D:Boolean;
		
		public function Action() {
			_supports2D = _supports3D = true;
			
			//priority = CommonActionPriority.getInstance().getPriority(Class(Object(this).constructor));
			priority = 0;
			
			active = true;
			_mask = 1;
		}
		
		/**
		 * Whether this action supports 2D.
		 */
		public function get supports2D():Boolean { return _supports2D; }
		/**
		 * Whether this action supports 3D.
		 */
		public function get supports3D():Boolean { return _supports3D; }
		
		/** @private */
		public final function doUpdate(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			skipThisAction = false;
			
			if (active) {
				var particle:Particle;
				var iter:ParticleIterator = particles.getIterator();
				particle = iter.particle();
				while (particle) {
					if (mask & particle.mask) update(emitter, particle, time);
					if (skipThisAction) return;
					iter.next();
					particle = iter.particle();
				}
			}
		}
		
		/** @private */
		/*
		public function doStraightUpdate(emitter:Emitter, particles:ParticleCollection, time:Number):void {
			skipThisAction = false;
			
			if (active) {
				var particle:Particle;
				var iter:ParticleIterator = particles.getIterator();
				while (particle = iter.particle()) {
					update(emitter, particle, time);
					if (skipThisAction) return;
					iter.next();
				}
			}
		}
		*/
		
		/**
		 * [Template Method] This method is called once upon each <code>Emitter.step()</code> method call, 
		 * before the <code>update()</code> calls with each particles in the emitter.
		 * 
		 * <p>
		 * All setup operatoins before the <code>update()</code> calls should be done here.
		 * </p>
		 * @param	emitter		The associated emitter.
		 * @param	time		The timespan of each emitter's step.
		 */
		public function preUpdate(emitter:Emitter, time:Number):void {
			//abstract method
		}
		
		/**
		 * [Template Method] Acts on all particles upon each <code>Emitter.step()</code> method call.
		 * 
		 * <p>
		 * Override this method to create custom actions.
		 * </p>
		 * @param	emitter		The associated emitter.
		 * @param	particle	The associated particle.
		 * @param	time		The timespan of each emitter's step.
		 */
		public function update(emitter:Emitter, particle:Particle, time:Number):void {
			//abstract method
		}
		
		/**
		 * [Template Method] This method is called once after each <code>Emitter.step()</code> method call, 
		 * after the <code>update()</code> calls with each particles in the emitter.
		 * 
		 * <p>
		 * All setup operatoins before the <code>update()</code> calls should be done here.
		 * </p>
		 * @param	emitter		The associated emitter.
		 * @param	time		The timespan of each emitter's step.
		 */
		public function postUpdate(emitter:Emitter, time:Number):void {
			//abstract method
		}
		
		/**
		 * Actions will be sorted by the associated emitter according to their priorities.
		 * 
		 * <p>
		 * This is important, 
		 * since it doesn't make sense to first update a particle's position according to its speed, 
		 * and then update the velocity according to gravity fields afterwards. 
		 * You can alter the priority of an action, but it is recommended that you use the default values.
		 * </p>
		 */
		public function get priority():int { return _priority; }
		public function set priority(value:int):void {
			_priority = value;
			onPriorityChange.dispatch(this);
		}
		
		/**
		 * Tells the emitter whether this action requires that particles must be sorted before the <code>update()</code> calls. 
		 * 
		 * <p>
		 * For instance, the <code>Collide</code> action needs all particles to be sorted in X positions.
		 * </p>
		 */
		public function get needsSortedParticles():Boolean {
			return false;
		}
		
		/**
		 * The action will affect a particle only if it's active and the bitwise AND of the action's mask and the particle's mask is non-zero, 
		 * 1 by default.
		 * 
		 * <p>
		 * This can be used to mask out specific particles that you do not wish to be affected by an action.
		 * </p>
		 */
		public function get mask():int { return _mask; }
		public function set mask(value:int):void {
			_mask = value;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Action";
		}
		
		public override function getElementTypeXMLTag():XML {
			return <actions/>;
		}
		
		public override function toXML():XML {
			var xml:XML = super.toXML();
			
			xml.@active = active;
			xml.@mask = mask;
			
			return xml;
		}
		
		public override function parseXML(xml:XML, builder:XMLBuilder = null):void {
			super.parseXML(xml, builder);
			
			if (xml.@active.length()) active = (xml.@active == "true");
			if (xml.@mask.length()) mask = parseInt(xml.@mask);
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}