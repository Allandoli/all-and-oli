package screens 
{
	import flash.events.KeyboardEvent;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import objects.Character;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class InGame extends Sprite 
	{
		// cambiar de pantalla si la anterior esta superada
		
		private var Bg:Image;
		private var Platform:Image;
		private var Player:Character;
		private var Interface:Image;
		private var CombBar:Image;
		private var EnergyBar:Image;
		private var CurrentCharIcon:Image;
		private var PauseKey:starling.events.KeyboardEvent;
		
		// llamar a los objetos a crear
		
		public function InGame() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{	
			drawScreen();
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
		
	}

}