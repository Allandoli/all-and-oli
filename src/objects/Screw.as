package objects
{
	import starling.display.Sprite;
	import starling.display.Image;
	import starling.events.Event;
	import Media;
	import Math;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Screw extends Sprite
	{
		private var _screwType:int;
		private var torn:Image;
		
		public function Screw(_screwType:int)
		{
			super();
			this.screwType = _screwType;
			this.x = x;
			this.y = y;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			//createScrew();
		}
		
		public function get screwType():int 
		{
			return _screwType;
		}
		
		public function set screwType(value:int):void 
		{
			_screwType = value;
			
			torn = new Image(Media.getTexture("Screw" + _screwType));
			torn.x = -torn.texture.width * 0.5;
			torn.y = -torn.texture.height * 0.5;
			this.addChild(torn);
			
		}
		
		/*public function createScrew():void
		{
			var i:int = Math.random() * 4;
			
			if (i == 1)
				torn = new Image(Media.getTexture("Screw1"));
			if (i == 2)
				torn = new Image(Media.getTexture("Screw2"));
			if (i == 3)
				torn = new Image(Media.getTexture("Screw3"));
			if (i == 4)
				torn = new Image(Media.getTexture("Screw4"));
			
			this.addChild(torn);
		}*/
	}

}