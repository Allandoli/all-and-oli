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
		public var plat:Platforms;
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
			spawn();
			
		}
		
		private function spawn():void 
		{
			var newLevel:Array = [new Platforms(this.physics, 1, 0),
new Platforms(this.physics, 2, 0),
new Platforms(this.physics, 1, 1024),
new Platforms(this.physics, 2, 1024),
new Platforms(this.physics, 1, 2048),
new Platforms(this.physics, 2, 2048),
new Platforms(this.physics, 1, 3272),
new Platforms(this.physics, 2, 3272),
new Platforms(this.physics, 6, 280),
new Platforms(this.physics, 6, 450),
new Platforms(this.physics, 6, 520),
new Platforms(this.physics, 7, 520),
new Platforms(this.physics, 6, 650),
new Platforms(this.physics, 6, 720),
new Platforms(this.physics, 3, 820),
new Platforms(this.physics, 4, 950),
new Platforms(this.physics, 6, 1150),
new Platforms(this.physics, 6, 1480),
new Platforms(this.physics, 3, 1580),
new Platforms(this.physics, 6, 1880),
new Platforms(this.physics, 6, 2210),
new Platforms(this.physics, 6, 2280),
new Platforms(this.physics, 7, 2280),
new Platforms(this.physics, 6, 2350),
new Platforms(this.physics, 6, 2870),
new Platforms(this.physics, 3, 3000),
new Platforms(this.physics, 4, 3120)];
			for (var i:int = 0; i < newLevel.length; i++) 
			{
				addChild(newLevel[i]);
			}
			Player = new Character(physics);
			Player.x = 200;
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
			if (Player.x > stage.stageWidth-400-x)
			{
				x -= 2;
				physics.globalOffsetX -= 2;
			}
			/*if (Player.x < 300-x)
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