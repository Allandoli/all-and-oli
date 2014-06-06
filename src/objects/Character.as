package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import com.greensock.motionPaths.RectanglePath2D;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import Media;
	import events.Animations;
	import starling.textures.TextureAtlas;
	import flash.events.TimerEvent;


	/**
	 * ...
	 * @author All & oli
	 */
	public class Character extends Sprite 
	{
		protected var physics:PhysInjector;
		public var Actual:PhysicsObject;
		public var lastX:int;
		public var lastY:int;
		//	public var ActualBrazo:PhysicsObject = null;
		private var Desactivado:PhysicsObject;
		public static var currentChar:String;
		public var brazo:Image;
		private	var atlas:TextureAtlas = Media.getAtlas();
		private var characterMovement:MovieClip;
		private var key:KeyboardEvent;
		private var _collectibleCounter:int;
		private var _screwCounter:int;
		public var energyAll:int;//max 100%
		private var energyOli:int;//max 100%
		public var exhaustionAll:int;//max 100%
		private var exhaustionOli:int;//max 100%
		private var _exhaustionChar:int;//max 100%
		private var _energyChar:int;//max 100%
		public var damage:int = 5;
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
		private var up:Boolean = false;
		private var left:Boolean = false;
		private var right:Boolean = false;
		private var animaciones:events.Animations;
		public var salto:Boolean = true;
		public var myTimer:Timer = new Timer(3000);
		

		public function Character(p:PhysInjector) 
		{
			this.physics = p;
			super();
			this.energyAll = 100;
			this.energyOli = 100;
			this.exhaustionAll = 100;
			this.exhaustionOli = 100;
			this._collectibleCounter = 0;
			this._screwCounter = 0;
			this._energyChar = 100;
			this._exhaustionChar = 100;
			this.animaciones = new Animations(Media.getAtlas());
			animaciones.addAnimation("AllDer", 6, true);
			animaciones.addAnimation("AllIzq", 6, true);
			animaciones.addAnimation("AllSaltoDer", 6, false);
			animaciones.addAnimation("AllSaltoIzq", 6, false);
			animaciones.addAnimation("AllFrontal", 1, false);
			animaciones.addAnimation("AllEstaticoDer", 1, false);
			animaciones.addAnimation("AllEstaticoIzq",1,false);
			animaciones.addAnimation("OliDer", 1, false);
			animaciones.addAnimation("OliIzq", 1, false);
			animaciones.addAnimation("OliDispDer", 5, true);
			animaciones.addAnimation("OliDispIzq", 5, true);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			myTimer.start();
			myTimer.addEventListener(TimerEvent.TIMER, actualizarEnergia);
		}
		
		private function actualizarEnergia(e:TimerEvent):void 
		{
			if(exhaustionAll<100){
			exhaustionAll += 10;}
		}
	

		private function onAddedToStage(e:Event):void 
		{
			addChild(animaciones);
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createCharacter();
			injectPhysics();
			this.addEventListener(KeyboardEvent.KEY_DOWN, movementActivation);
			this.addEventListener(KeyboardEvent.KEY_DOWN, skills);
			this.addEventListener(KeyboardEvent.KEY_UP, movementDeactivation);
			this.addEventListener(KeyboardEvent.KEY_UP, skillDeactivation);
			this.addEventListener(EnterFrameEvent.ENTER_FRAME,movement);
		}
		
		private function skillDeactivation(e:KeyboardEvent):void 
		{
			var aux:String = String.fromCharCode(e.charCode);
			if (aux.toLowerCase() == "j" || aux.toLowerCase() == "k" || aux.toLowerCase() == "l" || aux.toLowerCase() == "a" || aux.toLowerCase() == "d") 
			{
				if (animaciones.currentAnimation == "AllDer" || animaciones.currentAnimation == "AllEstaticoDer")
				{
					brazo.x = 8;
					brazo.texture = atlas.getTexture("AllBrazoDerA");
					brazo.readjustSize();
				}
				if (animaciones.currentAnimation == "AllIzq" || animaciones.currentAnimation == "AllEstaticoIzq")
				{
					brazo.x = 10;
					brazo.texture = atlas.getTexture("AllBrazoIzqA");
					brazo.readjustSize();
				}
			}
		}
		
		private function movement(e:EnterFrameEvent):void 
		{
			if (salto&&up) 
			{
				salto = false;
				Actual.body.ApplyImpulse(new b2Vec2(0, -8), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
				if (left&&up) 
				{
					brazo.visible = false;
					characterMovement = animaciones.play("AllSaltoIzq");
					Actual.body.ApplyImpulse(new b2Vec2(-2, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
				}
				if (right&&up) 
				{
					characterMovement = animaciones.play("AllSaltoDer");
					brazo.visible = false;
					Actual.body.ApplyImpulse(new b2Vec2(2, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
				}
			}
			else 
			{
					brazo.visible = true;
					if (left&&!up) 
					{
						characterMovement = animaciones.play("AllIzq");
						Actual.body.ApplyForce(new b2Vec2(-20, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					}
					if (right&&!up) 
					{
						characterMovement = animaciones.play("AllDer");
						Actual.body.ApplyForce(new b2Vec2(20, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					}
			}
		}
		
		private function movementDeactivation(e:KeyboardEvent):void 
		{
			var aux:String = String.fromCharCode(e.charCode);
			switch(aux.toLowerCase())
			{
				case "w":
					up = false;
					break;
				case "a":
					left = false;
					characterMovement = animaciones.play("AllEstaticoIzq");
					break;
				case "d":
					right = false;
					characterMovement = animaciones.play("AllEstaticoDer");
					break;
			}
		}

		private function skills(e:KeyboardEvent):void 
		{
			var aux:String =  String.fromCharCode(e.charCode);
			if (currentChar=="all") 
			{
				switch (aux.toLowerCase())
				{
					case "j"://ataque corto
						if (animaciones.currentAnimation=="AllDer"|| animaciones.currentAnimation=="AllEstaticoDer") 
						{
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoDer1");
						}
						if (animaciones.currentAnimation=="AllIzq"||animaciones.currentAnimation=="AllEstaticoIzq") 
						{
							brazo.x = -5;
							brazo.texture = atlas.getTexture("AllBrazoIzq1");
						}
						break;
					case "k"://ataque medio
						if(exhaustionAll >= 10){
							exhaustionAll -= 10;
							if (animaciones.currentAnimation=="AllDer"|| animaciones.currentAnimation=="AllEstaticoDer") 
							{
								brazo.x = 10;
								brazo.texture = atlas.getTexture("AllBrazoDer2");
							}
							if (animaciones.currentAnimation=="AllIzq"||animaciones.currentAnimation=="AllEstaticoIzq") 
							{
								brazo.x = -22;
								brazo.texture = atlas.getTexture("AllBrazoIzq2");
							}
						}
						break;
					case "l"://ataque largo
						if (exhaustionAll >= 20){
						exhaustionAll -= 20;
						if (animaciones.currentAnimation=="AllDer"|| animaciones.currentAnimation=="AllEstaticoDer") 
						{
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoDer3");
						}
						if (animaciones.currentAnimation=="AllIzq"||animaciones.currentAnimation=="AllEstaticoIzq") 
						{
							brazo.x = -52;
							brazo.texture = atlas.getTexture("AllBrazoIzq3");
						}}
						break;
				}
				brazo.readjustSize();
			}
		}

		public function createCharacter():void 
		{
			if (currentChar == "all")
			{
				characterMovement = animaciones.play("AllEstaticoDer");
				brazo = new Image(atlas.getTexture("AllBrazoDerA"));
				brazo.x = 8;
				brazo.y = 35;
				addChild(brazo);
			}
			else
			{
				characterMovement = animaciones.play("OliDer");
			}
		}


		private function movementActivation(e:KeyboardEvent):void 
		{
			var aux:String = String.fromCharCode(e.charCode);
			switch(aux.toLowerCase())
			{
				case "w":
					up = true;
					break;
				case "a":
					left = true;
					break;
				case "d":
					right = true;
					break;
			}
		}

		public function disposeTemporarily():void 
		{
			this.visible = false;
		}

		public function initialize():void
		{
			this.visible = true;
		}

		public function get screwCounter():int 
		{
			return _screwCounter;
		}

		public function set screwCounter(value:int):void 
		{
			_screwCounter = value;
		}

		public function get collectibleCounter():int 
		{
			return _collectibleCounter;
		}

		public function set collectibleCounter(value:int):void 
		{
			_collectibleCounter = value;
		}

		public function get exhaustionChar():int 
		{
			return _exhaustionChar;
		}

		public function set exhaustionChar(value:int):void 
		{
			_exhaustionChar -= value;
		}

		public function get energyChar():int 
		{
			return _energyChar;
		}

		public function set energyChar(value:int):void 
		{
			_energyChar -=value;
		}	
		private function injectPhysics():void
        {
			Actual = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Actual.body.SetFixedRotation(true);
			Actual.physicsProperties.contactGroup = "Jugador";
		}
		
		public function getBoundsBrazo():Rectangle
		{
			return new Rectangle(brazo.x+x, brazo.y+y, brazo.width, brazo.height);
		}
	}
}