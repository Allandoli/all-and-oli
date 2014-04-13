package  
{
	import events.KeyBoardEvent;
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
			screenWelcome = new Welcome();
			this.addChild(screenWelcome);
		}
		
		private function onChangeScreen(event:NavigationEvent):void 
		{
			switch(event.params.id)
			{
				case "play":
					screenInGame = new Tutorial();
					this.addChild(screenInGame);
					screenInGame.initialize();
					this.removeChild(screenWelcome);
					break;
				case "end":
					screenEnd = new End();
					screenEnd.initialize();
					this.addChild(screenEnd);
					break;
				case "start":
					screenWelcome.initialize();
					break;
				case "credits":
					screenCredits = new Credits();
					screenCredits.initialize()
					this.addChild(screenCredits);
					break;
			}
		}
		
	}

}