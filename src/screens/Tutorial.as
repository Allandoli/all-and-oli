package screens 
{
	import flash.events.KeyboardEvent;
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
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Tutorial extends Sprite 
	{
		// cambiar de pantalla si la anterior esta superada
		
		private var Bg:Image;
		private var Platform:Image;
		public var Player:Character;
		private var Interface:Image;
		private var CombBar:Image;
		private var EnergyBar:Image;
		private var CurrentCharIcon:Image;
		private var PauseKey:starling.events.KeyboardEvent;
		protected var physics:PhysInjector;
		
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
            var Playerp:PhysicsObject = physics.injectPhysics(Player, PhysInjector.SQUARE, new PhysicsProperties({isDynamic:true, friction:0.5, restitution:0.5}));
		}
		
		private function onAddedToStage(e:Event):void 
		{	
			drawScreen();
			Player = new Character();
			Player.x = 250;
			Player.y = 250;
			this.addChild(Player);
			injectPhysics();
			addEventListener(Event.ENTER_FRAME, onUpdate);
		}
		
		  protected function onUpdate(event:Event):void
        {
            physics.update();
        }
        		
		private function drawScreen():void
		{
			Bg = new Image(Media.getTexture("BgGame"));
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