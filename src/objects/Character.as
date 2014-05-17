package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import Media;
	import objects.Animations;
	import starling.textures.TextureAtlas;
	
	
	/**
	 * ...
	 * @author All & oli
	 */
	public class Character extends Sprite 
	{
		protected var physics:PhysInjector;
		public var Actual:PhysicsObject;
		private var Desactivado:PhysicsObject;
		public static var currentChar:String;
		private var lastmove:String;
		private var brazo:Image;
		private	var atlas:TextureAtlas = Media.getAtlas();
		private var characterMovement:MovieClip;
		private var key:KeyboardEvent;
		private var _collectibleCounter:int;
		private var _screwCounter:int;
		private var energyAll:int;//max 100%
		private var energyOli:int;//max 100%
		private var exhaustionAll:int;//max 100%
		private var exhaustionOli:int;//max 100%
		private var _exhaustionChar:int;//max 100%
		private var _energyChar:int;//max 100%
		public var damage:int = 5;
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
		private var suelo:Boolean = false;
		private var animaciones:Animations;

		
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
			this.addEventListener(KeyboardEvent.KEY_DOWN, onSwapCharacter);//evento de cambio de personaje
		}
		
		private function onAddedToStage(e:Event):void 
		{
			addChild(animaciones);
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createCharacter();
			injectPhysics();
			this.addEventListener(KeyboardEvent.KEY_DOWN, movementActivation);
			this.addEventListener(KeyboardEvent.KEY_DOWN, skills);
		}

		private function skills(e:KeyboardEvent):void 
		{
			var aux:String =  String.fromCharCode(e.charCode);
			if (currentChar=="all") 
			{
				switch (aux.toLowerCase())
				{
					case "j":
						if (animaciones.currentAnimation=="AllDer"|| animaciones.currentAnimation=="AllEstaticoDer") 
						{
							brazo.width = 25;
							brazo.height = 10;
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoDer1");
						}
						if (animaciones.currentAnimation=="AllIzq"||animaciones.currentAnimation=="AllEstaticoIzq") 
						{
							brazo.width = 25;
							brazo.height = 10;
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoIzq1");
						}
						break;
					case "k":
						if (animaciones.currentAnimation=="AllDer"|| animaciones.currentAnimation=="AllEstaticoDer") 
						{
							brazo.width = 42;
							brazo.height = 10;
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoDer2");
						}
						if (animaciones.currentAnimation=="AllIzq"||animaciones.currentAnimation=="AllEstaticoIzq") 
						{
							brazo.width = 42;
							brazo.height = 10;
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoIzq2");
						}
						break;
					case "l":
						if (animaciones.currentAnimation=="AllDer"|| animaciones.currentAnimation=="AllEstaticoDer") 
						{
							brazo.width = 72;
							brazo.height = 10;
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoDer3");
						}
						if (animaciones.currentAnimation=="AllIzq"||animaciones.currentAnimation=="AllEstaticoIzq") 
						{
							brazo.width = 72;
							brazo.height = 10;
							brazo.x = 10;
							brazo.texture = atlas.getTexture("AllBrazoIzq3");
						}
						break;
				}
			}
			else 
			{
				switch (aux.toLowerCase())
				{
					case "j":
						break;
					case "k":
						break;
					case "l":
						break;
				}
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
					if (currentChar=="all") 
					{
						if(lastmove=="a") 
						{
							brazo.visible = false;
							characterMovement = animaciones.play("AllSaltoIzq");
						}
						else 
						{
							if (lastmove=="d") 
							{
								brazo.visible = false;
								characterMovement = animaciones.play("AllSaltoDer");
							}
						}
					}
					else 
					{
						if(lastmove=="a") 
						{
							characterMovement = animaciones.play("OliIzq");
						}
						else 
						{
							if (lastmove=="d") 
							{
								characterMovement = animaciones.play("OliDer");
							}
						}
					}
					Actual.body.ApplyImpulse(new b2Vec2(0, -8), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					 break;
				case "a":
					if (currentChar=="all") 
					{
						brazo.x = 12;
						brazo.width = 10;
						brazo.height = 25;
						brazo.visible = true;
						brazo.texture = atlas.getTexture("AllBrazoIzqA");
						characterMovement = animaciones.play("AllIzq");
					}
					else 
					{
						characterMovement = animaciones.play("OliIzq")
					}
					Actual.body.ApplyImpulse(new b2Vec2( -1, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					break;
				case "d":
					if (currentChar=="all") 
					{
						brazo.x = 8;
						brazo.width = 10;
						brazo.height = 25;
						brazo.visible = true;
						brazo.texture = atlas.getTexture("AllBrazoDerA");
						characterMovement = animaciones.play("AllDer");
					}
					else 
					{
						characterMovement = animaciones.play("OliDer")
					}
					Actual.body.ApplyImpulse(new b2Vec2(1, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					break;
			}
			lastmove = aux.toLowerCase();
			trace(lastmove);
		}
		
		private function injectPhysics():void
        {
			Actual = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Actual.body.SetFixedRotation(true);
		}
		
		private function onSwapCharacter(e:KeyboardEvent):void 
		{
			if (String.fromCharCode(e.charCode)=="q" ||String.fromCharCode(e.charCode)=="Q") 
			{
				if (currentChar=="all") 
				{	
					if (energyOli>0) 
					{
						brazo.visible = false;
						energyAll = this._energyChar;
						exhaustionAll = this._exhaustionChar;
						currentChar = "oli";
						this._energyChar = energyOli;
						this._exhaustionChar = exhaustionOli;
						characterMovement = animaciones.play("OliDer");
					}
				}
				else 
				{
					if (energyAll>0) 
					{
						brazo.visible = true;
						energyOli = this._energyChar;
						exhaustionOli = this._exhaustionChar;
						currentChar = "all";
						this._energyChar = energyAll;
						this._exhaustionChar = exhaustionAll;
						characterMovement = animaciones.play("AllEstaticoDer");
					}
				}
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
	}
}