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
		private var welcomeAll:Image;
		private var welcomeOli:Image;
		private var welcomeCreBtn:Button;
		private var welcomePlayBtn:Button;
		private var titulo:Image;
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
			
			
			welcomeBg = new Image(Media.getTexture("fondomenu"));
			this.addChild(welcomeBg);
			
			welcomePlayBtn = new Button(Media.getTexture("PlayButton"));
			welcomePlayBtn.x = 512 - (150/2);
			welcomePlayBtn.y = 180;
			this.addChild(welcomePlayBtn);
			
			welcomeCreBtn = new Button(Media.getTexture("CreditsButton"));
			welcomeCreBtn.x = 512 - (150/2);
			welcomeCreBtn.y = 390;
			this.addChild(welcomeCreBtn);
			
			welcomeAll = new Image(Media.getTexture("allmenu"));
			welcomeAll.x = 20;
			welcomeAll.y = 100;
			this.addChild(welcomeAll);
			
			welcomeOli = new Image(Media.getTexture("olimenu"));
			welcomeOli.x = 670;
			welcomeOli.y = 40;
			this.addChild(welcomeOli);
			
			titulo = new Image(Media.getTexture("titulo"));
			titulo.x = 512 - (437/2);
			titulo.y = 10;
			this.addChild(titulo);
			
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
				Character.currentChar = "all";
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"teclas" }, true));
			}
			
			if ((buttonClicked as Button) == welcomeCreBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"credits" }, true));
			}
			
		}
	}

}