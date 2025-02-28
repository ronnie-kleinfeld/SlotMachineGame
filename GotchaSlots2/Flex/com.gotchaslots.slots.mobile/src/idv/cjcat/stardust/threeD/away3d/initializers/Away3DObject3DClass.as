package idv.cjcat.stardust.threeD.away3d.initializers {
	import away3d.core.base.Object3D;
	import idv.cjcat.stardust.common.utils.construct;
	import idv.cjcat.stardust.threeD.initializers.Initializer3D;
	import idv.cjcat.stardust.common.particles.Particle;
	
	/**
	 * Assigns a <code>Object3D</code> object to the <code>target</code> properties of a particle.
	 * This information can be visualized by <code>Away3DObject3DHandler</code>.
	 *
	 * @see away3d.core.base.Object3D
	 * @see idv.cjcat.stardust.threeD.away3d.handlers.Away3DObject3DHandler
	 */
	public class Away3DObject3DClass extends Initializer3D {
		
		private var _object3DClass:Class;
		private var _constructorParams:Array;
		public function Away3DObject3DClass(object3DClass:Class = null, constructorParams:Array = null) {
			this.object3DClass = object3DClass;
			this.constructorParams = constructorParams;
		}
		
		public function get object3DClass():Class { return _object3DClass; }
		public function set object3DClass(value:Class):void {
			if (!value) value = Object3D;
			_object3DClass = value;
		}
		
		public function get constructorParams():Array { return _constructorParams; }
		public function set constructorParams(value:Array):void {
			if (!value) value = [];
			_constructorParams = value;
		}
		
		public override final function initialize(particle:Particle):void {
			var o3D:Object3D = Object3D(construct(_object3DClass, _constructorParams));
			particle.target = o3D;
		}
		
		
		//XML
		//------------------------------------------------------------------------------------------------
		
		public override function getXMLTagName():String {
			return "Away3DObject3DClass";
		}
		
		//------------------------------------------------------------------------------------------------
		//end of XML
	}
}