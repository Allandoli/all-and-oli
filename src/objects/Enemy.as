package objects 
{
	import Box2D.Common.Math.b2Vec2;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
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
		private var health:int;
		private var movement:MovieClip;//animacionas para andar
		private var enemyType:int;//1 mordedor, 2 volador, 3 aspiradora, 4 olla, 5 robot imanes
		private var Cuerpo:PhysicsObject;
		private var animaciones:Animations;
		private var enemigo:Image;
		
		private	var atlas:TextureAtlas = Media.getAtlas();

		
		public function Enemy(type:int,p:PhysInjector, x:int) 
		{
			super();
			this.physics = p;
			this.x = x;
			enemyType = type;
			this.animaciones = new Animations(Media.getAtlas());
			animaciones.addAnimation("DinoDer", 4, true);
			animaciones.addAnimation("DinoIzq", 4, true);
			animaciones.addAnimation("DinoAtDer", 4, true);
			animaciones.addAnimation("DinoAtIzq", 4, true);
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
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
			switch (enemyType) 
			{
				case 1:
					
					movement = animaciones.play("DinoIzq");
					
					this.y = 300;
				break;
				
			}
		}
		
		private function injectPhysics():void
        {
			Cuerpo = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			Cuerpo.body.SetFixedRotation(true);
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
		
	}

}