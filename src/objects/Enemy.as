package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import events.Animations;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.TextureAtlas;
	import Media;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Enemy extends Sprite 
	{
		private var physics:PhysInjector;
		private var _health:int;
		private var movement:MovieClip;//animacionas para andar
		private var enemyType:int;//1 mordedor, 2 volador, 3 aspiradora, 4 olla, 5 robot imanes
		public var Cuerpo:PhysicsObject;
		private var animaciones:Animations;
		private var enemigo:Image;
		private var origen:int;
		private	var atlas:TextureAtlas = Media.getAtlas();
		private var atacando:Boolean;
		public var vel:Number = -140;

		
		public function Enemy(type:int,p:PhysInjector, x:int) 
		{
			super();
			this.physics = p;
			this.x = x;
			enemyType = type;
			this.origen = x;
			this.animaciones = new Animations(Media.getAtlas());
			animaciones.addAnimation("DinoDer", 4, true);
			animaciones.addAnimation("DinoIzq", 4, true);
			animaciones.addAnimation("DinoAtDer", 4, true);
			animaciones.addAnimation("DinoAtIzq", 4, true);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.addEventListener(Event.ENTER_FRAME, onRango);
			this.addEventListener(Event.ENTER_FRAME, attackMode);

		}
		
		private function onRango(e:Event):void 
		{
			Cuerpo.body.ApplyForce(new b2Vec2(vel, 0),new b2Vec2(Cuerpo.body.GetLocalCenter().x, Cuerpo.body.GetLocalCenter().y));
		}
		
		private function onAddedToStage(e:Event):void 
		{
			addChild(animaciones);
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createEnemy();
			injectPhysics();
		}
		
		private function createEnemy():void 
		{
			switch (this.enemyType) 
			{
				case 1:
					
					this.movement = animaciones.play("DinoIzq");
					this.y = 312;
					this.health = 150;
				break;
				
			}
		}
		
		private function attackMode(e:Event):void
		{
			for (var i:int = 0; i < parent.numChildren; i++)
			{
				var obj:starling.display.DisplayObject = parent.getChildAt(i);
				var pj:Character = (obj as Character);
				if (pj != null)
				{
					if (pj.x >= this.x - 100 && pj.x <=this.x)
					{
						this.movement = animaciones.play("DinoAtIzq");
					}
					if (pj.x >= this.x+1 && pj.x <= this.x + this.width + 100)
					{
						this.movement = animaciones.play("DinoAtDer");
					}
				}
			}
		}
		
		public function invertirMov():void
		{
			vel *= -1;
			if (animaciones.currentAnimation == "DinoDer") 
			{
				this.movement = animaciones.play("DinoIzq");
			}
			else 
			{
				 if(animaciones.currentAnimation == "DinoIzq") 
				{
					this.movement = animaciones.play("DinoDer");
				}
			}
		}
		
		private function injectPhysics():void
        {
			this.Cuerpo = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			this.Cuerpo.body.SetFixedRotation(true);
			this.Cuerpo.physicsProperties.contactGroup = "Enemigo";
		}
		/*public function follow():void // posible idea para que los enemigos te sigan
		{
			if (this.positionX-Character.positionx>150) 
			{
				atack();
				if (this.positionX>Character.positionx) 
				{
					this.positionX --;
				}
				else 
				{
					this.positionX++;
				}
			}
		}*/
		private function attack():void
		{
			//cambio de imagen
		}
		
		public function get health():int 
		{
			return _health;
		}
		
		public function set health(value:int):void 
		{
			_health = value;
		}
		
	}

}