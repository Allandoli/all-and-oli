package  
{
	import events.NavigationEvent;
	import starling.display.Sprite;
	import starling.events.Event;
	import screens.Welcome;
	import screens.InGame;
	import screens.End;
	import screens.Credits;
	
	/**
	 * ...
	 * @author argrwhrh
	 */
	
	public class Game extends Sprite 
	{
		private var screenWelcome:Welcome;
		private var screenInGame:InGame;
		private var screenEnd:End;
		private var screenCredits:Credits;
		
		
		public function Game() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(event:Event):void 
		{
			trace("starling frameworks funciona");
		
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenInGame = new InGame();
			screenInGame.disposeTemporarily();
			this.addChild(screenInGame);
			
			screenEnd = new End();
			screenEnd.disposeTemporarily();
			this.addChild(screenEnd);
			
			screenCredits = new Credits();
			screenCredits.disposeTemporarily();
			this.addChild(screenCredits);
			
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);
			screenWelcome.initialize();
		}
		
		private function onChangeScreen(event:NavigationEvent):void 
		{
			switch(event.params.id)
			{
				case "play":
					screenWelcome.disposeTemporarily();
					screenInGame.initialize();
					break;
				case "end":
					screenInGame.disposeTemporarily();
					screenEnd.initialize();
					break;
				case "start":
					screenEnd.disposeTemporarily();
					screenWelcome.initialize();
					break;
				case "credits":
					screenEnd.disposeTemporarily();
					screenCredits.initialize();
					break;
			}
		}
		
	}

}