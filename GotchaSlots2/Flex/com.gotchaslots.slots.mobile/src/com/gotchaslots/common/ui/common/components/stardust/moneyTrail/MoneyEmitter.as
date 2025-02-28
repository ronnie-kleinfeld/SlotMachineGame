package com.gotchaslots.common.ui.common.components.stardust.moneyTrail
{
	import com.gotchaslots.common.assets.common.CommonEmbed;
	
	import idv.cjcat.stardust.common.actions.Age;
	import idv.cjcat.stardust.common.actions.DeathLife;
	import idv.cjcat.stardust.common.actions.ScaleCurve;
	import idv.cjcat.stardust.common.clocks.Clock;
	import idv.cjcat.stardust.common.initializers.Life;
	import idv.cjcat.stardust.common.math.UniformRandom;
	import idv.cjcat.stardust.twoD.actions.Accelerate;
	import idv.cjcat.stardust.twoD.actions.Move;
	import idv.cjcat.stardust.twoD.emitters.Emitter2D;
	import idv.cjcat.stardust.twoD.initializers.DisplayObjectClass;
	import idv.cjcat.stardust.twoD.initializers.Position;
	import idv.cjcat.stardust.twoD.initializers.Velocity;
	import idv.cjcat.stardust.twoD.zones.LazySectorZone;
	import idv.cjcat.stardust.twoD.zones.SinglePoint;
	
	public class MoneyEmitter extends Emitter2D
	{
		// members
		public var point:SinglePoint;
		
		// events
		public function MoneyEmitter(clock:Clock)
		{
			super(clock);
			
			point = new SinglePoint();
			
			//initializers
			addInitializer(new DisplayObjectClass(CommonEmbed.Chip));
			addInitializer(new Position(point));
			addInitializer(new Velocity(new LazySectorZone(0.00001, 0)));
			addInitializer(new Life(new UniformRandom(25, 5)));
			
			//actions
			addAction(new Age());
			addAction(new DeathLife());
			addAction(new Accelerate(0.025));
			addAction(new Move());
			addAction(new ScaleCurve(15, 15));
		}
	}
}