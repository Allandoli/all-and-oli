package screens 
{
	import flash.geom.Point;
	import objects.Character;
	import objects.Background;
	import objects.Platforms;
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
	
	/**
	 * ...
	 * @author All & oli
	 */
	
	
	public class Tutorial extends Sprite 
	{
		protected var physics:PhysInjector;

		// cambiar de pantalla si la anterior esta superada
		public var floor:Platforms;
		public var roof:Platforms;
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
			
		}
		
		private function onAddedToStage(e:Event):void 
		{	
			injectPhysics();
			drawScreen();
			floor = new Platforms(physics);
			floor.x = 0;
			floor.y = 542;
			this.addChild(floor);
			roof = new Platforms(physics);
			roof.x = 0;
			roof.y = 0;
			roof.visible = false;
			this.addChild(roof);
			Player = new Character(physics);
			Player.x = 250;
			Player.y = 150;
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
		//	var p:Point = localToGlobal(new Point(Player.x, Player.y));
			
			if (Player.x > stage.stageWidth-300-x)
			{
				x -= 1;
				physics.globalOffsetX -= 1;
			}
			if (Player.x < 300-x)
			{
				x += 1;
				physics.globalOffsetX += 1;
			}
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