package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Edgar
	 */
	public class GUI extends Sprite 
	{
		
		public var screws:int;
		public var vidaImagen:Image;
		public var vidaImagenFondo:Image;
		public var energiaImagen:Image;
		public var vidaImagenAltIni:int;
		
		public function GUI() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function onAddedToStage(e:Event):void 
		{
			
			if (Character.currentChar == "all") { 
				energiaImagen = new Image (Media.getTexture("chapaall")); 
				vidaImagen = new Image (Media.getTexture("litio"));
				vidaImagenFondo = new Image (Media.getTexture("bateria")); 
				vidaImagenAltIni = vidaImagen.height;}
			else if (Character.currentChar == "oli") { energiaImagen = new Image (Media.getTexture("chapaoli")); }
			createChapas();
			
		}
		
		private function createChapas():void
		{
			energiaImagen.x = 20;
			energiaImagen.y = 20;
			this.addChild(energiaImagen);
			vidaImagenFondo.x = 20;
			vidaImagenFondo.y = 75;
			this.addChild(vidaImagenFondo);
			vidaImagen.x = 20;
			vidaImagen.y = 75;
			this.addChild(vidaImagen);

		}
		
		public function update(x:int):void 
		{
			energiaImagen.x = x;
			vidaImagenFondo.x = x;
			vidaImagen.x = x;
			vidaImagen.pivotY = -vidaImagenAltIni;
			vidaImagen.scaleY = 0.5;
			//vidaImagen.y += vidaImagen.height/2;



		}
		
	}

}