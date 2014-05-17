package objects 
{
	import com.reyco1.physinjector.data.PhysicsObject;
	import com.reyco1.physinjector.PhysInjector;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Adrian
	 */
	public class Projectil extends Sprite 
	{
		private var physics:PhysInjector
		public var cuerpo:PhysicsObject;

		public function Projectil(p:PhysInjector) 
		{
			super();
			this.physics = p;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			injectPhysics();
		
		}
		
		private function injectPhysics():void
        {
			cuerpo = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			cuerpo.body.SetFixedRotation(true);
			cuerpo.body.IsBullet() = true;
		}
		
		
	}

}