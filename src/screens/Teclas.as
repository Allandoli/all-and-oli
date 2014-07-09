package screens 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import events.NavigationEvent;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Teclas extends Sprite 
	{
		private var teclasBg:Image;
		//private var creditsText:Image;
		private var teclasStartBtn:Button;
		
		public function Teclas() 
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
			
			teclasBg = new Image(Media.getTexture("BgTeclas"));
			this.addChild(teclasBg);
			
			teclasStartBtn = new Button(Media.getTexture("PlayButton"));
			teclasStartBtn.x = 500;
			teclasStartBtn.y = 175;
			this.addChild(teclasStartBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		public function disposeTemporarily():void 
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		public function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == teclasStartBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"play" }, true));
			}
		}
		
	}

}