package screens 
{
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import events.NavigationEvent;
	
	/**
	 * ...
	 * @author 
	 */
	
	 public class Welcome extends Sprite 
	{
		private var welcomeBg:Image;
		private var welcomeTitle:Image;
		//private var welcomeAll:Image;
		//private var welcomeOli:Image;
		
		private var welcomePlayBtn:Button;
		private var welcomeCreditsBtn:Button;
		
		public function Welcome() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
				private function onAddedToStage(event:Event):void 
		{
			trace("pantalla inicio");
			
			drawScreen();
		}
		
		private function drawScreen():void 
		{
			welcomeBg = new Image(Media.getTexture("BgWelcome"));
			this.addChild(welcomeBg);
			
			welcomePlayBtn = new Button(Media.getTexture("PlayButton"));
			welcomePlayBtn.x = 500;
			welcomePlayBtn.y = 500;
			this.addChild(welcomePlayBtn);
			
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
			if ((buttonClicked as Button) == welcomePlayBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"play" }, true));
			}
		}
	}

}