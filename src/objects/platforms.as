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
		public var type:int;
		
		public function Platforms(p:PhysInjector, t:int, x:int) 
		{
			super();
			this.x = x;
			this.physics = p;
			this.type = t;
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
			switch(type)
			{
				case 1:
					cuerpo = new Image(Media.getTexture("SueloTutorial"));//Suelo
					this.addChild(cuerpo);
					y = 540;
					break;
				case 2:
					cuerpo = new Image(Media.getTexture("SueloTutorial"));//Techo
					this.visible = false;
					this.addChild(cuerpo);
					y = -60;
					break;
				case 3:
					cuerpo = new Image(Media.getTexture("PlatTutoA2"));//Aerea Baja
					this.addChild(cuerpo);
					y = 350;
					break;
				case 4:
					cuerpo = new Image(Media.getTexture("PlatTutoA2"));//Aerea Media
					this.addChild(cuerpo);
					y = 280;
					break;
				case 5:
					cuerpo = new Image(Media.getTexture("PlatTutoA2"));//Aerea Alta
					this.addChild(cuerpo);
					y = 200;
					break;
				case 6:
					cuerpo = new Image(Media.getTexture("PlatTutoS1"));//Cubo1
					this.addChild(cuerpo);
					y = 470;
					break;
				case 7:
					cuerpo = new Image(Media.getTexture("PlatTutoS2"));//Cubo2
					this.addChild(cuerpo);
					y = 400;
					break;
				}
		}
		
		private function injectPhysics():void
        {
			Actual = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:false, friction:0.5, restitution:0 } ));
			Actual.physicsProperties.contactGroup = "Plataforma";
		}
	}
}