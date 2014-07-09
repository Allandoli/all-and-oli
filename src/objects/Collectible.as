package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	import starling.events.Event;
	import Media;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Collectible extends Sprite
	{
		
		private var collect:Image;
		protected var physics:PhysInjector;
		public var oliPart:int;
		public var obj:PhysicsObject;
		
		public function Collectible(p:PhysInjector, tipo:int, x:int)
		{
			super();
			this.x = x;
			this.physics = p;
			this.oliPart = tipo;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createCollectible();
			injectPhysics();
		}
		
		private function createCollectible():void 
		{
				switch(oliPart)
			{
				case 1:
					collect = new Image(Media.getTexture("OliCollect1"));
					this.addChild(collect);
					break;
				case 2:
					collect = new Image(Media.getTexture("OliCollect2"));
					this.addChild(collect);
					break;
				case 3:
					collect = new Image(Media.getTexture("OliCollect3"));
					this.addChild(collect);
					break;
				case 4:
					collect = new Image(Media.getTexture("OliCollect4"));
					this.addChild(collect);
			}
		}
		
		private function injectPhysics():void 
		{
			obj = physics.injectPhysics(this, PhysInjector.SQUARE, new PhysicsProperties( { isDynamic:true, friction:0.5, restitution:0 } ));
			obj.body.SetFixedRotation(true);
			obj.physicsProperties.contactGroup = "ParteOli";
		}
	}
}