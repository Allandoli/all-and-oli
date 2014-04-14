package objects 
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	import Media;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Character extends Sprite 
	{
		// KeyboardEvent -> click derecho -> Find all references
		
		// HABILIDADES ?????????? KeyboardEvent(j/k/l) ??????????
		
		public var characterImage:Image;
		public var characterMovement:MovieClip;
		public static var currentChar:String;
		private var key:KeyboardEvent;
		private var _collectibleCounter:int;
		private var _screwCounter:int;
		private var energyAll:int;//max 100%
		private var energyOli:int;//max 100%
		private var exhaustionAll:int;//max 100%
		private var exhaustionOli:int;//max 100%
		private var _exhaustionChar:int;//max 100%
		private var _energyChar:int;//max 100%
		public var damage:int = 5;
		public static var characterX:int;
		
		public function Character() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			this.energyAll = 100;
			this.energyOli = 100;
			this.exhaustionAll = 100;
			this.exhaustionOli = 100;
			this._collectibleCounter = 0;
			this._screwCounter = 0;
			this._energyChar = 100;
			this._exhaustionChar = 100;
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
		
		public function createCharacter():void 
		{
			if (currentChar == "all")
			{
				characterImage = new Image(Media.getTexture("AllLeft"));
				this.addChild(characterImage);
			}
			else
			{
				characterImage = new Image(Media.getTexture("OliEstaticoDer"));
				this.addChild(characterImage);
			}
		}
		
		/*private function swapCharacter():void //cambio de caracter condicionado a si el otro tiene vida o no
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
						characterX++;
						break;
					case "keyUp":
						characterImage = new Image(Media.getTexture("AllJump.png"));
						break;
					case "keyLeft":
						characterImage = new Image(Media.getTexture("AllLeft.png"));
						characterX--;
						break;
					}
					break;
				case "oli":	
					switch (key) 
					{
					case "keyRight":
						characterImage = new Image(Media.getTexture("OliRight.png"));
						characterX++;
						break;
					case "keyUp":
						characterImage = new Image(Media.getTexture("OliJump.png"));
						break;
					case "keyLeft":
						characterImage = new Image(Media.getTexture("OliLeft.png"));
						characterX--;
						break;
					}
					break;
			}
		}*/
		
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
			_exhaustionChar -= value;
		}
		
		public function get energyChar():int 
		{
			return _energyChar;
		}
		
		public function set energyChar(value:int):void 
		{
			_energyChar -=value;
		}
	}
}