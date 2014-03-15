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
		// image
		// energyBar
		// exhaustionBar
		// screwCount
		// collectibleCount
		
		// KeyboardEvent -> click derecho -> Find all references
		
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
		
		// CAMBIAR IMAGEN CON SWITCH EN VEZ DE CON TANTOS IF ???????????????????
		
		private var characterImage:Image;
		private var currentChar:CharacterEvent;
		private var key:KeyboardEvent;
		private var collectibleCounter:int;
		private var screwCounter:int;
		private var energyBar:Image;
		private var exhaustionBar:Image;
		
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
		
		private function charMovement(charCode):void
		{
			
			key = new KeyboardEvent(null);
			
			if (charCode == "all")
			{
				if (key == "keyRight") 
				{
				characterImage = new Image(Media.getTexture("AllRight.png"));
				}
			else if (key == "keyUp")
				{
				characterImage = new Image(Media.getTexture("AllJump.png"));
				}
			else if (key == "keyLeft")
				{
				characterImage = new Image(Media.getTexture("AllLeft.png"));
				}
			}
			
			else if (charCode == "oli") // if charCode == null ??????????
			{
				if (key == "keyRight") 
				{
				characterImage = new Image(Media.getTexture("OliRight.png"));
				}
			else if (key == "keyUp")
				{
				characterImage = new Image(Media.getTexture("OliJump.png"));
				}
			else if (key == "keyLeft")
				{
				characterImage = new Image(Media.getTexture("OliLeft.png"));
				}
			}
		}
		
	}

}