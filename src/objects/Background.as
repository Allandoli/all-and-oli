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
		private var Fondo3:Image;
		private var Fondo4:Image;
		private var Fondo5:Image;
		private var Fondo6:Image;
		private var Fondo7:Image;
		private var Fondo8:Image;
		private var Fondo9:Image;
		private var Fondo10:Image;
		
		public function Background() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
				
			Fondo1 = new Image(Media.getTexture("BgTutorial1"));
			Fondo2 = new Image(Media.getTexture("BgTutorial"));
			Fondo3 = new Image(Media.getTexture("BgTutorial2"));
			Fondo4 = new Image(Media.getTexture("BgTutorial1"));
			Fondo5 = new Image(Media.getTexture("BgTutorial"));
			Fondo6 = new Image(Media.getTexture("BgTutorial2"));
			Fondo7 = new Image(Media.getTexture("BgTutorial1"));
			Fondo8 = new Image(Media.getTexture("BgTutorial"));
			Fondo9 = new Image(Media.getTexture("BgTutorial2"));
			Fondo10 = new Image(Media.getTexture("BgTutorial"));
			
			Fondo1.x = 0;
			Fondo1.y = stage.stageHeight - Fondo1.height;
			
			Fondo2.x = Fondo1.width;
			Fondo2.y = Fondo1.y;
			
			Fondo3.x = Fondo1.width * 2;
			Fondo3.y = Fondo2.y;
			
			Fondo4.x = Fondo1.width * 3;
			Fondo4.y = Fondo3.y;
			
			Fondo5.x = Fondo1.width * 4;
			Fondo5.y = Fondo4.y;
			
			Fondo6.x = Fondo1.width * 5;
			Fondo6.y = Fondo5.y;
			
			Fondo7.x = Fondo1.width * 6;
			Fondo7.y = Fondo6.y;
			
			Fondo8.x = Fondo1.width * 7;
			Fondo8.y = Fondo7.y;
			
			Fondo9.x = Fondo1.width * 8;
			Fondo9.y = Fondo8.y;
			
			Fondo10.x = Fondo1.width * 9;
			Fondo10.y = Fondo9.y;
			
			this.addChild(Fondo1);
			this.addChild(Fondo2);
			this.addChild(Fondo3);
			this.addChild(Fondo4);
			this.addChild(Fondo5);
			this.addChild(Fondo6);
			this.addChild(Fondo7);
			this.addChild(Fondo8);
			this.addChild(Fondo9);
			this.addChild(Fondo10);
			
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onEnterFrame);
				
		}
		
		private function onEnterFrame(e:EnterFrameEvent):void 
		{

		}
				
	}

}