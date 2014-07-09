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
	public class Credits extends Sprite 
	{
		private var creditsBg:Image;
		//private var creditsText:Image;
		private var creditsStartBtn:Button;
		
		public function Credits() 
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
			
			creditsBg = new Image(Media.getTexture("BgEnd"));
			this.addChild(creditsBg);
			
			creditsStartBtn = new Button(Media.getTexture("PlayButton"));
			creditsStartBtn.x = 437;
			creditsStartBtn.y = 350;
			this.addChild(creditsStartBtn);
			
			this.addEventListener(Event.TRIGGERED, onMainMenuClick);
		}
		
		public function disposeTemporarily():void 
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
			trace("pantalla creditos");
		}
		
		public function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;
			if ((buttonClicked as Button) == creditsStartBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, { id:"start" }, true));
			}
		}
		
	}

}