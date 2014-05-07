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
		private var characterImage:Image;
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
		private var up:Boolean = false;
		private var left:Boolean = false;
		private var right:Boolean = false;
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
			this.animaciones = new Animations();
			animaciones.addAnimation("AllDer", 3, true);
			animaciones.addAnimation("AllIzq", 3, true);
			animaciones.addAnimation("AllSaltoDer", 3, false);
			animaciones.addAnimation("AllSaltoIzq", 3, false);
			animaciones.addAnimation("AllPunDer", 3, true);
			animaciones.addAnimation("AllPunIzq", 3, true);
			animaciones.addAnimation("OliDer", 1, false);
			animaciones.addAnimation("OliIzq", 1, false);
			animaciones.addAnimation("OliDispDer", 5, true);
			animaciones.addAnimation("OliDispIzq", 5, true);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onSwapCharacter);//evento de cambio de personaje
		}
		
		private function onAddedToStage(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createCharacter();
			injectPhysics();
			this.addEventListener(KeyboardEvent.KEY_DOWN, movementActivation);
			this.addEventListener(KeyboardEvent.KEY_UP, movementDeactivation);
		}
		
		public function createCharacter():void 
		{
			if (currentChar == "all")
			{
				characterMovement = new MovieClip(Media.getAtlas().getTextures("AllDer3"), 1);
				this.addChild(characterMovement);
				
			}
			else
			{
				characterMovement = new MovieClip(Media.getAtlas().getTextures("OliDer"), 1);
				this.addChild(characterMovement);
			}
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
		
		private function movementActivation(e:KeyboardEvent):void 
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
		
		private function movement():void 
		{
			if (currentChar == "all") 
			{
				if (up)
				{
					//fuerza arriba
					Actual.body.ApplyImpulse(new b2Vec2(0, -10), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					characterMovement = animaciones.play("AllSaltoDer");
					
					if (left)
					{
						//fuerza izq
						Actual.body.ApplyForce(new b2Vec2( -40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						characterMovement = animaciones.play("AllSaltoIzq");
					}
					if (right)
					{
						//fuerza der
						Actual.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						characterMovement = animaciones.play("AllSaltoDer");
					}
				}
				else
				{
					if (left)
					{
						//fuerza atras
						Actual.body.ApplyForce(new b2Vec2( -40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						characterMovement = animaciones.play("AllIzq");
					}
					if (right)
					{
						//fuerza alante
						Actual.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						characterMovement = animaciones.play("AllDer");
					}
				}
			}
			else 
			{
				if (up)
				{
					//fuerza arriba
					Actual.body.ApplyImpulse(new b2Vec2(0, -10), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
					this.removeChild(characterMovement);
					characterMovement = new MovieClip(Media.getAtlas().getTextures("OliDer"), 1);
					this.addChild(characterMovement);
					
					if (left)
					{
						//fuerza atras
						Actual.body.ApplyForce(new b2Vec2( -40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						this.removeChild(characterMovement);
						characterMovement = new MovieClip(Media.getAtlas().getTextures("OliIzq"), 1);
						this.addChild(characterMovement);
					}
					if (right)
					{
						//fuerza alante
						Actual.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						this.removeChild(characterMovement);
						characterMovement = new MovieClip(Media.getAtlas().getTextures("OliDer"), 1);
						this.addChild(characterMovement);
					}
				}
				else
				{
					if (left)
					{
						//fuerza atras
						Actual.body.ApplyForce(new b2Vec2( -40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						this.removeChild(characterMovement);
						characterMovement = new MovieClip(Media.getAtlas().getTextures("OliIzq"), 1);
						this.addChild(characterMovement);
					}
					if (right)
					{
						//fuerza alante
						Actual.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Actual.body.GetLocalCenter().x, Actual.body.GetLocalCenter().y));
						this.removeChild(characterMovement);
						characterMovement = new MovieClip(Media.getAtlas().getTextures("OliDer"), 1);
						this.addChild(characterMovement);
					}
				}
			}
		}	
		
		private function injectPhysics():void
        {
			Actual = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Actual.body.SetFixedRotation(true);
			//Desactivado = physics.injectPhysics(characterImage, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0, restitution:0 } ));
			//Desactivado.body.SetFixedRotation(true);
		}
		
		private function onSwapCharacter(e:KeyboardEvent):void 
		{
			/*if (String.fromCharCode(e.charCode)=="q") 
			{
				if (currentChar=="all") 
				{	
					if (energyOli>0) 
					{
						energyAll = this._energyChar;
						exhaustionAll = this._exhaustionChar;
						currentChar = "oli";
						this._energyChar = energyOli;
						this._exhaustionChar = exhaustionOli;
						characterImage.texture = Media.getTexture("OliDer");
						this.addChild(characterImage);
					}
				}
				else 
				{
					if (energyAll>0) 
					{
						energyOli = this._energyChar;
						exhaustionOli = this._exhaustionChar;
						currentChar = "all";
						this._energyChar = energyAll;
						this._exhaustionChar = exhaustionAll;
						characterImage.texture = Media.getTexture("AllDer1");
						this.addChild(characterImage);
					}
				}
			}*/
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