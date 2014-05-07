package objects 
{
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import Box2D.Common.Math.b2Vec2;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	
	/**
	 * ...
	 * @author Adrian
	 */
	public class Platforms extends Sprite 
	{
		protected var physics:PhysInjector;
		private var Actual:PhysicsObject;
		public var cuerpo:Image;
		private var type:String;
		
		public function Platforms(p:PhysInjector) 
		{
			this.physics = p;
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		}
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createPlatform();
			injectPhysics();
		}
		public function createPlatform():void 
		{
			cuerpo = new Image(Media.getTexture("SueloTutorial"));
			this.addChild(cuerpo);
		}
		
		private function injectPhysics():void
        {
			Actual = physics.injectPhysics(cuerpo, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:false, friction:0.5, restitution:0 } ));
		}
	}
}