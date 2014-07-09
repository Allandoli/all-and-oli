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
	
	public class End extends Sprite 
	{
		private var endBg:Image;
		private var endTitle:Image;
		private var endStartBtn:Button;
		private var endCreditsBtn:Button;
		
		public function End() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void 
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{
			
			endBg = new Image(Media.getTexture("fondomenu"));
			this.addChild(endBg);
			
			endStartBtn = new Button(Media.getTexture("PlayButton"));
			endStartBtn.x = 200;
			endStartBtn.y = 100;
			this.addChild(endStartBtn);
			
			endCreditsBtn = new Button(Media.getTexture("CreditsButton"));
			endCreditsBtn.x = 200;
			endCreditsBtn.y = 200;
			this.addChild(endCreditsBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		public function disposeTemporarily():void 
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
			trace("pantalla final");
		}
		
		public function onMainMenuClick(event:Event):void
		{
			
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == endStartBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"start" }, true));
			}
			else 
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"credits" }, true));
			}
		}
	}

}