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
	
	
	/**
	 * ...
	 * @author All & oli
	 */
	public class Character extends Sprite 
	{
		public var physics:PhysInjector;
		private var Actual:PhysicsObject;
		private var Desactivado:PhysicsObject;
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
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
		public var up:Boolean = false;
		public var left:Boolean = false;
		public var right:Boolean = false;
		private var X:Number;
		

		
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
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(KeyboardEvent.KEY_DOWN, onSwapCharacter);//evento de cambio de personaje
		}
		
		private function onAddedToStage(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createCharacter();
			injectPhysics();
			this.addEventListener(Event.ENTER_FRAME, onUpdate);
			this.addEventListener(KeyboardEvent.KEY_DOWN, movementActivation);
			this.addEventListener(KeyboardEvent.KEY_UP, movementDeactivation);
		}
		
		public function injectPhysics():void
        {
			Actual = physics.injectPhysics(characterImage, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Desactivado = physics.injectPhysics(characterImage, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Actual.body.SetFixedRotation(true);
			Desactivado.body.SetFixedRotation(true);
		}
		
		private function onSwapCharacter(e:KeyboardEvent):void 
		{
			if (String.fromCharCode(e.charCode)=="q") 
			{
				if (currentChar=="all") 
				{	if (energyOli>0) 
					{
						energyAll = this._energyChar;
						exhaustionAll = this._exhaustionChar;
						currentChar = "oli";
						this._energyChar = energyOli;
						this._exhaustionChar = exhaustionOli;
						characterImage.texture = Media.getTexture("OliEstaticoDer");
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
						characterImage.texture = Media.getTexture("AllRight");
						this.addChild(characterImage);
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
		
		public function createCharacter():void 
		{
			if (currentChar == "all")
			{
				characterImage = new Image(Media.getTexture("AllRight"));
				this.addChild(characterImage);
			}
			else
			{
				characterImage = new Image(Media.getTexture("OliEstaticoDer"));
				this.addChild(characterImage);
			}
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
		
		protected function onUpdate(event:Event):void
        {
            physics.update();
        }
		
		public function clear():void
        {
            removeEventListener(Event.ENTER_FRAME, onUpdate);
            physics.dispose();
            physics = null;
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
		
		public function charPosition(currentChar:String):int
		{
			return X = Actual.body.GetLocalCenter().x
		}
		
		public function movement():void 
		{
			if (up)
			{
				//fuerza arriba
				Actual.body.ApplyImpulse(new b2Vec2(0, -10), new b2Vec2(Actual.body.GetLocalCenter().x,Actual.body.GetLocalCenter().y));
				if (left)
				{
					//fuerza atras
					Actual.body.ApplyForce(new b2Vec2(-40, 0), new b2Vec2(Actual.body.GetLocalCenter().x,Actual.body.GetLocalCenter().y));
				}
				if (right)
				{
					//fuerza alante
					Actual.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Actual.body.GetLocalCenter().x,Actual.body.GetLocalCenter().y));
				}
			}
			else
			{
				if (left)
				{
					//fuerza atras
					Actual.body.ApplyForce(new b2Vec2(-40, 0), new b2Vec2(Actual.body.GetLocalCenter().x,Actual.body.GetLocalCenter().y));
				}
				if (right)
				{
					//fuerza alante
					Actual.body.ApplyForce(new b2Vec2(40, 0), new b2Vec2(Actual.body.GetLocalCenter().x,Actual.body.GetLocalCenter().y));
				}
			}
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
		
		
	}
}