package objects 
{
	import events.NavigationEvent;
	import starling.events.Event;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Background extends Sprite 
	{
		
		private var Fondo1:Image;
		private var Fondo2:Image;
		private var parallax:Number;
		private var speed:Number = 10;
		
		public function Background() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
				
			Fondo1 = new Image(Media.getTexture("BgTutorial"));
			Fondo2 = new Image(Media.getTexture("BgTutorial"));
			
			Fondo1.x = 0;
			Fondo1.y = stage.stageHeight - Fondo1.height;
			
			Fondo2.x = Fondo1.width;
			Fondo2.y = Fondo1.y;
			
			this.addChild(Fondo1);
			this.addChild(Fondo2);
			
			parallax = 0.02;
			
		//	this.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
				
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void 
		{
			Fondo1.x -= Math.ceil(speed * parallax);
			if (Fondo1.x < -stage.stageWidth) Fondo1.x = 0;
			
			Fondo2.x -= Math.ceil(speed * parallax);
			if (Fondo2.x < 0) Fondo2.x = Fondo1.width;
		}
				
	}

}