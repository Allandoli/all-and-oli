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
		private var screwType:int;
		private var torn:Image;
		
		public function Screw(tipo:int)
		{
			super();
			this.screwType = tipo;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			createScrew();
		}		
		
		public function createScrew():void 
		{
			this.torn = new Image(Media.getTexture("Screw" + this.screwType));
			this.torn.x = -torn.texture.width * 0.5;
			this.torn.y = -torn.texture.height * 0.5;
			this.addChild(torn);
			
		}
		
	}

}