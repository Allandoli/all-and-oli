package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;

	
	/**
	 * ...
	 * @author Adrian
	 */
	public class Platforms extends Sprite 
	{
		public var body:Image;
		private var type:String;
		
		public function Platforms() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);

		}
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			createPlatform();
		}
		public function createPlatform():void 
		{
			body = new Image(Media.getTexture("SueloTutorial"));
			this.addChild(body);
		}
	}

}