package objects
{
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import Media;
	import Math;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Screw extends Sprite
	{
		protected var physics:PhysInjector;
		private var screwType:int;
		private var torn:Image;
		public var Tornillo:PhysicsObject;
		
		public function Screw(p:PhysInjector, tipo:int, x:int)
		{
			super();
			this.x = x;
			this.physics = p;
			this.screwType = tipo;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createScrew();
			injectPhysics();
		}
		
		public function createScrew():void 
		{
			switch(screwType)
			{
				case 1:
					torn = new Image(Media.getTexture("Screw1"));
					this.addChild(torn);
					y = 100;
					break;
				case 2:
					torn = new Image(Media.getTexture("Screw2"));
					this.addChild(torn);
					y = 100;
					break;
				case 3:
					torn = new Image(Media.getTexture("Screw3"));
					this.addChild(torn);
					y = 100;
					break;
				case 4:
					torn = new Image(Media.getTexture("Screw4"));
					this.addChild(torn);
					y = 100;
					break;
			}
		}
		
		private function injectPhysics():void
        {
			Tornillo = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Tornillo.body.SetFixedRotation(false);
			Tornillo.physicsProperties.contactGroup = "Tornillo";
		}
		
	}

}