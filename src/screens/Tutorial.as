package screens 
{
	import objects.Platforms;
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import objects.Character;
	import starling.events.Event;
	import Box2D.Common.Math.b2Vec2;
    import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Tutorial extends Sprite 
	{
		// cambiar de pantalla si la anterior esta superada
		public var floor:Platforms;
		public var roof:Platforms;
		private var Bg:Image;
		public var Player:Character;
		private var Interface:Image;
		private var CombBar:Image;
		private var EnergyBar:Image;
		private var CurrentCharIcon:Image;
		private var PauseKey:starling.events.KeyboardEvent;
		protected var physics:PhysInjector;
		public var Playerp:PhysicsObject;
		public var Floorp:PhysicsObject;
		public var Roofp:PhysicsObject;
		public var up:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		
		// llamar a los objetos a crear
		
		public function Tutorial() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function injectPhysics():void
        {
			PhysInjector.STARLING = true;
            physics = new PhysInjector(Starling.current.nativeStage, new b2Vec2(0, 60), true);
			Playerp= physics.injectPhysics(Player, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0.5 } ));
			Floorp= physics.injectPhysics(floor, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:false, friction:0.5, restitution:0.5 } ));
			Roofp = physics.injectPhysics(roof, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:false, friction:0.5, restitution:0.5 } ));

		}
		
		private function onAddedToStage(e:Event):void 
		{	
			drawScreen();
			floor = new Platforms();
			floor.x = 0;
			floor.y = 542;
			this.addChild(floor);
			roof = new Platforms();
			roof.x = 0;
			roof.y = 0;
			roof.visible = false;
			this.addChild(roof);
			Player = new Character();
			Player.x = 250;
			Player.y = 150;
			this.addChild(Player);
			injectPhysics();
			this.addEventListener(Event.ENTER_FRAME, onUpdate);
			this.addEventListener(KeyboardEvent.KEY_DOWN, movementActivation);
			this.addEventListener(KeyboardEvent.KEY_UP, movementDeactivation);
		}
		
		private function movementDeactivation(e:KeyboardEvent):void 
		{
			var aux:String =  String.fromCharCode(e.charCode);
			if ( aux == "w" || aux == "W")
			{
				up = false;
			}
			if (aux == "a" || aux == "A")
			{
				left = false;
			}
			if( aux == "d" || aux == "D")
			{
				right = false;
			}
			movement();
		}
		
		private function movement():void 
		{
			if (up)
			{
				//fuerza arriba
				Playerp.body.ApplyImpulse(new b2Vec2(0, -10), new b2Vec2(Playerp.body.GetPosition().x, Playerp.body.GetPosition().y));
				if (left)
				{
					//fuerza atras
					Playerp.body.ApplyForce(new b2Vec2(-80, 0), new b2Vec2(Playerp.body.GetWorldCenter().x,Playerp.body.GetWorldCenter().y));
				}
				if (right)
				{
					//fuerza alante
					Playerp.body.ApplyForce(new b2Vec2(80, 0), new b2Vec2(Playerp.body.GetWorldCenter().x,Playerp.body.GetWorldCenter().y));
				}
			}
			else
			{
				if (left)
				{
					//fuerza atras
					Playerp.body.ApplyForce(new b2Vec2(-40, 0), new b2Vec2(Playerp.body.GetWorldCenter().x,Playerp.body.GetWorldCenter().y));
				}
				if (right)
				{
					//fuerza alante
					Playerp.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Playerp.body.GetWorldCenter().x,Playerp.body.GetWorldCenter().y));
				}
			}
		}
		
		  protected function onUpdate(event:Event):void
        {
            physics.update();
        }
		public function movementActivation(e:KeyboardEvent):void
		{
			var aux:String =  String.fromCharCode(e.charCode);
			if ( aux == "w" || aux == "W")
			{
				up = true;
			}
			if (aux == "a" || aux == "A")
			{
				left = true;
			}
			if( aux == "d" || aux == "D")
			{
				right = true;
			}
			movement();
		}
	
		private function drawScreen():void
		{
			Bg = new Image(Media.getTexture("BgTutorial"));
			this.addChild(Bg);
		}
		
		public function disposeTemporarily():void 
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		public function clear():void
        {
            removeEventListener(Event.ENTER_FRAME, onUpdate);
            physics.dispose();
            physics = null;
        }    
	}

}