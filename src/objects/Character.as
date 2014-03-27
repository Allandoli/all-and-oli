package objects 
{
	import events.CharacterEvent;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Character extends Sprite 
	{
		// currentChar
		// energyBar
		// exhaustionBar
		// screwCount
		// collectibleCount
		// las barras no irian en el game? y que el game lea nuestros int de energy y exaustion?
		// KeyboardEvent -> click derecho -> Find all references
		
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
		
		private var characterImage:Image;
		private var currentChar:CharacterEvent;
		private var key:KeyboardEvent;
		private var collectibleCounter:int;
		private var screwCounter:int;
		private var energyBar:Image;
		private var energyAll:int;//max 100%
		private var energyOli:int;//max 100%
		private var exhaustionBar:Image;
		private var exhaustionAll:int;//max 100%
		private var exhaustionOli:int;//max 100%
		
		public function Character() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
		}
		
		private function onAddedToStage(e:Event):void 
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createCharacter();
		}
		
		public function disposeTemporarily():void 
		{
			this.visible = false;
		}
		
		public function initialize():void
		{
			this.visible = true;
		}
		
		private function createCharacter():void 
		{
			if (currentChar == "all")
			{
				characterImage = new Image(Media.getTexture("All.png"));
				this.addChild(characterImage);
			}
			else
			{
				characterImage = new Image(Media.getTexture("Oli.png"));
				this.addChild(characterImage);
			}
		}
		private function swapCharacter():void //cambio de caracter condicionado a si el otro tiene vida o no
		{
			if (currentChar=="all") 
			{	if (energyOli>0) 
				{
					currentChar = "oli";
				}
			}
			else 
			{
				if (energyAll>0) 
				{
					currentChar = "all";
				}
			}
		}
		
		private function charMovement(charCode):void
		{
			key = new KeyboardEvent(null);
			switch (charCode) 
			{
				case "all":	
					switch (key) 
					{
					case "keyRight":
						characterImage = new Image(Media.getTexture("AllRight.png"));
						break;
					case "keyUp":
						characterImage = new Image(Media.getTexture("AllJump.png"));
						break;
					case "keyLeft":
						characterImage = new Image(Media.getTexture("AllLeft.png"));
						break;
					case null:
						characterImage = new Image(Media.getTexture("All.png"));
						break;
					}
					break;
				case "oli":	
					switch (key) 
					{
					case "keyRight":
						characterImage = new Image(Media.getTexture("OliRight.png"));
						break;
					case "keyUp":
						characterImage = new Image(Media.getTexture("OliJump.png"));
						break;
					case "keyLeft":
						characterImage = new Image(Media.getTexture("OliLeft.png"));
						break;
					case null:
						characterImage = new Image(Media.getTexture("Oli.png"));
						break;
					}
					break;
			}
		}
	}
}