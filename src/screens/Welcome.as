package screens 
{
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import events.NavigationEvent;
	import objects.Character;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author 
	 */
	
	 public class Welcome extends Sprite 
	{
		
		private var welcomeBg:Image;
		private var welcomeTitle:Image;
		private var welcomeCreditsBtn:Button;
		private var welcomeAllBtn:Button;
		private var welcomeOliBtn:Button;
		
		public function Welcome() 
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
			welcomeBg = new Image(Media.getTexture("BgWelcome"));
			this.addChild(welcomeBg);
			
			welcomeAllBtn = new Button(Media.getTexture("AllButton"));
			welcomeAllBtn.x = 300;
			welcomeAllBtn.y = 300;
			this.addChild(welcomeAllBtn);
			
			welcomeOliBtn = new Button(Media.getTexture("OliButton"));
			welcomeOliBtn.x = 400;
			welcomeOliBtn.y = 400;
			this.addChild(welcomeOliBtn);
			
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
			if ((buttonClicked as Button) == welcomeAllBtn)
			{
				Character.currentChar = "all";
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"play" }, true));
			}
			if ((buttonClicked as Button) == welcomeOliBtn)
			{
				Character.currentChar = "oli";
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"play" }, true));
				
			}
		}
	}

}