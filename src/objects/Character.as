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
			// collectibleCount
		// las barras no irian en el game? y que el game lea nuestros int de energy y exaustion?
		// KeyboardEvent -> click derecho -> Find all references
		
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
		
		private var characterImage:Image;
		private var currentChar:CharacterEvent;
		private var key:KeyboardEvent;
		private var _collectibleCounter:int;
		private var _screwCounter:int;
		private var energyAll:int;//max 100%
		private var energyOli:int;//max 100%
		private var exhaustionAll:int;//max 100%
		private var exhaustionOli:int;//max 100%
		private var _exhaustionChar:int;//max 100%
		private var _energyChar:int;//max 100%
		
		public function Character() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this._energyAll = 100;
			this._energyOli = 100;
			this._exhaustionAll = 100;
			this._exhaustionOli = 100;
			this._collectibleCounter = 0;
			this._screwCounter = 0;
			
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
					energyAll = this._energyChar;
					exhaustionAll = this._exhaustionChar;
					currentChar = "oli";
					this._energyChar = energyOli;
					this._exhaustionChar = exhaustionOli;
				}
			}
			else 
			{
				if (energyAll>0) 
				{
					energyOli = this._energyChar;
					exhaustionOli = this._exhaustionChar;
					currentChar = "all";
					this._energyChar = energyAll;
					this._exhaustionChar = exhaustionAll;
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
		
		public function get screwCounter():int 
		{
			return _screwCounter;
		}
		
		public function set screwCounter(value:int):void 
		{
			_screwCounter = value;
		}
		
		public function get collectibleCounter():int 
		{
			return _collectibleCounter;
		}
		
		public function set collectibleCounter(value:int):void 
		{
			_collectibleCounter = value;
		}
		
		public function get exhaustionChar():int 
		{
			return _exhaustionChar;
		}
		
		public function set exhaustionChar(value:int):void 
		{
			_exhaustionChar = value;
		}
		
		public function get energyChar():int 
		{
			return _energyChar;
		}
		
		public function set energyChar(value:int):void 
		{
			_energyChar = value;
		}
	}
}