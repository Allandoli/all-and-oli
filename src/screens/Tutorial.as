package screens 
{
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import objects.Character;
	import objects.Background;
	import objects.Collectible;
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
	import events.NavigationEvent;
	import objects.GUI;
	
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
		private var gui:GUI;
		public var Player:Character;
		private var Interface:Image;
		private var CombBar:Image;
		private var EnergyBar:Image;
		private var CurrentCharIcon:Image;
		public var up:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		public var chapaposicion:int;
		public var pie:Image;
		
		
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
			ContactManager.onContactBegin("Jugador", "ParteOli", coleccionables, true);
			ContactManager.onContactBegin("Enemigo", "Tornillo", colisionMonstruoTornillo, true);
			ContactManager.onContactBegin("Jugador", "Enemigo", daño, true);


		}
		
		private function daño(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void 
		{
			Player.energyAll -= 10;
			(objectB.displayObject as Enemy).Cuerpo.body.ApplyImpulse(new b2Vec2(60, 0), new b2Vec2((objectB.displayObject as Enemy).Cuerpo.body.GetLocalCenter().x, (objectB.displayObject as Enemy).Cuerpo.body.GetLocalCenter().y));
			if (Player.energyAll <= 0) 
			{
				physics.removePhysics(objectA.displayObject, true);
				
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"start" }, true));
			}
		}
		
		private function coleccionables(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void 
		{
			Player.collectibleCounter = Player.collectibleCounter + 1;
			physics.removePhysics(objectB.displayObject, true);
		}
		
		private function saltar(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void 
		{
			
			if ((objectB.displayObject as Platforms).y-Player.y >=90 ) 
			{
				Player.lastX = Player.x;
				Player.lastY = Player.y;
				Player.salto = true;
			}

		}
		
		private function puntos(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void
		{
			Player.screwCounter = Player.screwCounter + 1;
			physics.removePhysics(objectB.displayObject, true);
		}
		
		private function colisionMonstruoPlataforma(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void
		{
			if ((objectB.displayObject as Platforms).type != 1 )
			{
				(objectA.displayObject as Enemy).invertirMov();
			}
		}
		
		private function colisionMonstruoTornillo(objectA:PhysicsObject, objectB:PhysicsObject, contact:b2Contact):void
		{
			if ((objectB.displayObject as Screw).screwType < 5 )
			{
				(objectA.displayObject as Enemy).invertirMov();
			}
		}
		
		private function onAddedToStage(e:Event):void 
		{	
			chapaposicion = 20;
			injectPhysics();
			drawScreen();
			spawn();
			drawGui();
		}
		
		private function drawGui():void {
			gui = new GUI();
			this.addChild(gui);
		}
		
		private function spawn():void 
		{
			var newLevel:Array = [new Platforms(this.physics, 1, 0),
				new Platforms(this.physics, 2, 0),
				new Platforms(this.physics, 1, 1024),
				new Platforms(this.physics, 2, 1024),
				new Platforms(this.physics, 1, 2048),
				new Platforms(this.physics, 2, 2048),
				new Platforms(this.physics, 2, 3072),
				new Platforms(this.physics, 1, 4096),
				new Platforms(this.physics, 2, 4096),
				new Platforms(this.physics, 2, 5120),
				new Platforms(this.physics, 1, 6144),
				new Platforms(this.physics, 2, 6144),
				// Empiezan las paltaformas
				new Platforms(this.physics, 6, 280),
				new Platforms(this.physics, 9, 450),
				new Platforms(this.physics, 7, 520),
				new Platforms(this.physics, 6, 690),
				new Platforms(this.physics, 3, 820),
				new Platforms(this.physics, 4, 940),
				new Platforms(this.physics, 10, 1150),
				new Platforms(this.physics, 6, 1430),
				new Platforms(this.physics, 3, 1600),
				new Platforms(this.physics, 6, 1800),
				new Platforms(this.physics, 8, 1880),
				new Platforms(this.physics, 6, 2210),
				new Platforms(this.physics, 10, 2280),
				new Platforms(this.physics, 6, 2350),
				new Platforms(this.physics, 3, 2500),
				new Platforms(this.physics, 9, 2730),
				new Platforms(this.physics, 3, 2980),
				new Platforms(this.physics, 8, 3120),
				new Platforms(this.physics, 3, 3400),
				new Platforms(this.physics, 3, 3550),
				new Platforms(this.physics, 8, 3700),
				new Platforms(this.physics, 11, 3950),
				new Platforms(this.physics, 10, 4130),
				new Platforms(this.physics, 3, 4280),
				new Platforms(this.physics, 3, 4380),
				new Platforms(this.physics, 4, 4580),
				new Platforms(this.physics, 6, 4730),
				new Platforms(this.physics, 6, 4800),
				new Platforms(this.physics, 3, 4950),
				new Platforms(this.physics, 8, 5100),
				new Platforms(this.physics, 4, 5350),
				new Platforms(this.physics, 11, 5500),
				new Platforms(this.physics, 11, 5650),
				new Platforms(this.physics, 3, 5800),
				new Platforms(this.physics, 8, 5970),
				new Platforms(this.physics, 4, 6240),];

			for (var i:int = 0; i < newLevel.length; i++) 
			{
				addChild(newLevel[i]);
			}
			
			var arrayScrew:Array = [new Screw(this.physics, Math.ceil(Math.random() * 4), 400), 
			new Screw(this.physics, Math.ceil(Math.random() * 4), 600),		
			new Screw(this.physics, Math.ceil(Math.random() * 4), 870),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1175),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1350),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1600),		
			new Screw(this.physics, Math.ceil(Math.random() * 4), 1900),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2100),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2550),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 2980),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 3100),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 3270),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 3560),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 3940),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 4100),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 4330),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 4570),
			new Screw(this.physics, Math.ceil(Math.random() * 4), 4820),];
				
			
			for (var j:int = 0; j < arrayScrew.length; j++)
			{
				addChild(arrayScrew[j]);
			}
			
			var arrayOliParts:Array = [new Collectible(this.physics, 4, 1000), 
			new Collectible(this.physics, 2, 2300),		
			new Collectible(this.physics, 3, 3380),
			new Collectible(this.physics, 1, 5050)];
			
			for (var k:int = 0; k < arrayOliParts.length; k++)
			{
				addChild(arrayOliParts[k]);
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
		
		private function colisionBrazo():void
		{
			for (var i:int = 0; i < this.numChildren; i++)
			{
				var obj:starling.display.DisplayObject = this.getChildAt(i);
				var enemy:Enemy = (obj as Enemy);
				if (enemy != null)
				{
					if (Player.getBoundsBrazo().intersects(obj.bounds)) {
						enemy.health = enemy.health - Player.damage;
						enemy.Cuerpo.body.ApplyForce(new b2Vec2(-enemy.vel*5, 0),new b2Vec2(enemy.Cuerpo.body.GetLocalCenter().x, enemy.Cuerpo.body.GetLocalCenter().y));
						if (enemy.health <= 0) 
						{
							physics.removePhysics(enemy, true);
						}
					}
				}
			}
		}
		
		protected function onUpdate(event:Event):void
        {			
			
			if (Player.x > stage.stageWidth-600-x)
			{
				gui.contadorPiezas(Player);
				x -= 4;
				physics.globalOffsetX -= 4;
				chapaposicion += 4;
				gui.update(chapaposicion);
			}
			colisionBrazo()
			
			if (Player.y > 600)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"start" }, true));
			}
			/*if (Player.y > 600) 
			{
				Player.x = Player.lastX;
				Player.y = Player.lastY;
				Player.energyAll -= 10;
			}
			if (Player.x < 300-x)
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