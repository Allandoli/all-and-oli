package screens 
{
	import flash.geom.Point;
	import objects.Character;
	import objects.Background;
	import objects.Enemy;
	import objects.Platforms;
	import objects.Screw;
	import starling.core.Starling;
	import starling.core.starling_internal;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import starling.events.EnterFrameEvent;
	import Box2D.Common.Math.b2Vec2;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import Box2D.Dynamics.Contacts.b2Contact;
	import com.reyco1.physinjector.contact.ContactManager;
	
	/**
	 * ...
	 * @author All & oli
	 */
	
	
	public class Tutorial extends Sprite 
	{
		protected var physics:PhysInjector;

		// cambiar de pantalla si la anterior esta superada
		public var plat:Platforms;
		private var Bg:Background;
		public var Player:Character;
		private var Interface:Image;
		private var CombBar:Image;
		private var EnergyBar:Image;
		private var CurrentCharIcon:Image;
		public var up:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		
		// llamar a los objetos a crear
		
		public function Tutorial() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		private function injectPhysics():void
        {
			PhysInjector.STARLING = true;
            physics = new PhysInjector(Starling.current.nativeStage, new b2Vec2(0, 60), true);
			physics.allowDrag = false;
			ContactManager.onContactBegin("Jugador", "Tornillo", puntos, true);
			ContactManager.onContactBegin("Jugador", "Plataforma", saltar, true);
			ContactManager.onContactBegin("Enemigo", "Plataforma", colisionMonstruoPlataforma, true);
		}
		
		private function saltar(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void 
		{
			trace(Player.y);
			trace((objectB.displayObject as Platforms).y);
			if (Player.y+(objectB.displayObject as Platforms).height  <= (objectB.displayObject as Platforms).y ) 
			{
				Player.salto = true;
			}
		}
		
		private function puntos(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void
		{
			Player.screwCounter = Player.screwCounter + 1;
			trace (Player.screwCounter);
			physics.removePhysics(objectB.displayObject, true);
		}
		private function colisionMonstruoPlataforma(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void
		{
			if ((objectB.displayObject as Platforms).type != 1)
			{
				(objectA.displayObject as Enemy).invertirMov();
			}
		}
	
		private function onAddedToStage(e:Event):void 
		{	
			injectPhysics();
			drawScreen();
			spawn();
			
		}
		
		private function spawn():void 
		{
			var newLevel:Array = [new Platforms(this.physics, 1, 0),
				new Platforms(this.physics, 2, 0),
				new Platforms(this.physics, 1, 1024),
				new Platforms(this.physics, 2, 1024),
				new Platforms(this.physics, 1, 2048),
				new Platforms(this.physics, 2, 2048),
				new Platforms(this.physics, 1, 3272),
				new Platforms(this.physics, 2, 3272),
				new Platforms(this.physics, 6, 280),
				new Platforms(this.physics, 6, 450),
				new Platforms(this.physics, 6, 520),
				new Platforms(this.physics, 7, 520),
				new Platforms(this.physics, 6, 650),
				new Platforms(this.physics, 6, 720),
				new Platforms(this.physics, 3, 820),
				new Platforms(this.physics, 4, 950),
				new Platforms(this.physics, 6, 1150),
				new Platforms(this.physics, 6, 1480),
				new Platforms(this.physics, 3, 1580),
				new Platforms(this.physics, 6, 1880),
				new Platforms(this.physics, 6, 2210),
				new Platforms(this.physics, 6, 2280),
				new Platforms(this.physics, 7, 2280),
				new Platforms(this.physics, 6, 2350),
				new Platforms(this.physics, 6, 2870),
				new Platforms(this.physics, 3, 3000),
				new Platforms(this.physics, 4, 3120)];

			for (var i:int = 0; i < newLevel.length; i++) 
			{
				addChild(newLevel[i]);
			}
			
			var arrayScrew:Array = [new Screw(this.physics, Math.ceil(Math.random() * 4), 400), 
			new Screw(this.physics, Math.ceil(Math.random() * 4), 600),		
			new Screw(this.physics, Math.ceil(Math.random() * 4), 900),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1150),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1350),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1600),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1750),		
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1900),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2100),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2300),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2550),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2800)];
				
			
			for (var j:int = 0; j < arrayScrew.length; j++)
			{
				addChild(arrayScrew[j]);
			}
			
			var enemy:Enemy = new Enemy(1, physics, 850);
			this.addChild(enemy);
			
			Player = new Character(physics);
			Player.x = 200;
			Player.y = 100;
			this.addChild(Player);
			
		}
		
		private function drawScreen():void
		{
			Bg = new Background();
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
	  protected function onUpdate(event:Event):void
        {			
			if (Player.x > stage.stageWidth-600-x)
			{
				x -= 4;
				physics.globalOffsetX -= 4;
			}
			/*if (Player.x < 300-x)
			{
				x += 1;
				physics.globalOffsetX += 1;
			}*/
            physics.update();
        }
		
		public function clear():void
        {
            removeEventListener(Event.ENTER_FRAME, onUpdate);
            physics.dispose();
            physics = null;
        }
	}

}