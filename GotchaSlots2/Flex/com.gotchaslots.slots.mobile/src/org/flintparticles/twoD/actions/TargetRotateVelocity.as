/*
 * FLINT PARTICLE SYSTEM
 * .....................
 * 
 * Author: Richard Lord
 * Copyright (c) Richard Lord 2008-2011
 * http://flintparticles.org
 * 
 * 
 * Licence Agreement
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package org.flintparticles.twoD.actions 
{
	import org.flintparticles.common.actions.ActionBase;
	import org.flintparticles.common.emitters.Emitter;
	import org.flintparticles.common.particles.Particle;
	import org.flintparticles.twoD.particles.Particle2D;	

	/**
	 * The TargetRotateVelocity action adjusts the angular velocity of the particle 
	 * towards the target angular velocity.
	 */
	public class TargetRotateVelocity extends ActionBase
	{
		private var _vel:Number;
		private var _rate:Number;
		
		/**
		 * The constructor creates a TargetRotateVelocity action for use by an emitter. 
		 * To add a TargetRotateVelocity to all particles created by an emitter, use the
		 * emitter's addAction method.
		 * 
		 * @see org.flintparticles.common.emitters.Emitter#addAction()
		 * 
		 * @param targetVelocity The target angular velocity, in radians per second.
		 * @param rate Adjusts how quickly the particle reaches the target angular 
		 * velocity. Larger numbers cause it to approach the target angular velocity 
		 * more quickly.
		 */
		public function TargetRotateVelocity( targetVelocity:Number = 0, rate:Number = 0.1 )
		{
			this.targetVelocity = targetVelocity;
			this.rate = rate;
		}
		
		/**
		 * The target angular velocity, in radians per second.
		 */
		public function get targetVelocity():Number
		{
			return _vel;
		}
		public function set targetVelocity( value:Number ):void
		{
			_vel = value;
		}
		
		/**
		 * Adjusts how quickly the particle reaches the target angular velocity.
		 * Larger numbers cause it to approach the target angular velocity more quickly.
		 */
		public function get rate():Number
		{
			return _rate;
		}
		public function set rate( value:Number ):void
		{
			_rate = value;
		}
		
		/**
		 * Calculates the difference between the particle's angular velocity and
		 * the target and adjusts the angular velocity closer to the target by an
		 * amount proportional to the difference, the time and the rate of convergence.
		 * 
		 * <p>This method is called by the emitter and need not be called by the 
		 * user.</p>
		 * 
		 * @param emitter The Emitter that created the particle.
		 * @param particle The particle to be updated.
		 * @param time The duration of the frame - used for time based updates.
		 * 
		 * @see org.flintparticles.common.actions.Action#update()
		 */
		public override function update( emitter:Emitter, particle:Particle, time:Number ):void
		{
			var p:Particle2D = Particle2D( particle );
			p.angVelocity += ( _vel - p.angVelocity ) * _rate * time;
		}
	}
}
