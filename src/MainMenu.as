package  
{
	import events.NavigationEvent;
	import objects.Character;
	import starling.display.Sprite;
	import starling.events.Event;
	import screens.Welcome;
	import screens.Tutorial;
	import screens.End;
	import screens.Credits;
	
	/**
	 * ...
	 * @author 
	 */
	
	public class MainMenu extends Sprite 
	{
		private var screenWelcome:Welcome;
		private var screenInGame:Tutorial;
		private var screenEnd:End;
		private var screenCredits:Credits;
		private var charAll:Character;
		private var charOli:Character;
		
		
		public function MainMenu() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(event:Event):void 
		{		
			this.addEventListener(events.NavigationEvent.CHANGE_SCREEN, onChangeScreen);
			
			screenInGame = new Tutorial();
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