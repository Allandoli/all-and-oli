package objects 
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import objects.Character;
	
	import starling.utils.HAlign;
	
	/**
	 * ...
	 * @author Edgar
	 */
	public class GUI extends Sprite 
	{
		public var screwImage:Image;
		public var screws:int;
		
		public var vidaImagen:Image;
		public var vidaImagenFondo:Image;
		public var energiaImagen:Image;
		public var vidaImagenAltIni:int;
		
		public var exhaustionFondo:Image;
		public var exhaustionBarra:Image;
		public var exhaustionTri:Image;
		
		public var portaChapas:Image;
		public var screwText:TextField;
		
		public var contadorPiezasOli:Image;
		
		public function GUI() 
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function onAddedToStage(e:Event):void 
		{
			screws = 125;
			if (Character.currentChar == "all") { 
				energiaImagen = new Image (Media.getTexture("chapaall")); 
				vidaImagen = new Image (Media.getTexture("gasoil"));
				vidaImagenFondo = new Image (Media.getTexture("carburador")); 
				vidaImagenAltIni = vidaImagen.height;}
			else if (Character.currentChar == "oli") { energiaImagen = new Image (Media.getTexture("chapaoli"));
				vidaImagen = new Image (Media.getTexture("litio"));
				vidaImagenFondo = new Image (Media.getTexture("bateria")); 
				vidaImagenAltIni = vidaImagen.height;}
			
			exhaustionFondo = new Image (Media.getTexture("exhaustionfondo"));
			exhaustionBarra = new Image (Media.getTexture("exhaustionbarra"));
			exhaustionTri = new Image (Media.getTexture("exhaustiontri"));
			portaChapas = new Image (Media.getTexture("portachapas"));
			screwImage = new Image (Media.getTexture("Screw4"));
			
			screwText = new TextField(58, 30, screws.toString(), "Arial", 20, 0x0, false);
			createChapas();
			
		}
		
		private function createChapas():void
		{
			energiaImagen.x = 20;
			energiaImagen.y = 20;
			this.addChild(energiaImagen);
			vidaImagenFondo.x = 27;
			vidaImagenFondo.y = 75;
			this.addChild(vidaImagenFondo);
			vidaImagen.x = 28;
			vidaImagen.y = 86;
			this.addChild(vidaImagen);
			vidaImagen.height = (vidaImagenAltIni * 85) / 100; //El valor 85 será el valor entero que tendrá el personaje (Hay que crear una función que se llame al quitar energia y que actualice el tamaño)
			vidaImagen.y += vidaImagenAltIni - vidaImagen.height;
			
			exhaustionFondo.x = 75;
			exhaustionFondo.y = 30;
			exhaustionBarra.x = 76;
			exhaustionBarra.y = 31;
			exhaustionTri.x = exhaustionBarra.width + 76;
			exhaustionTri.y = 31;
			this.addChild(exhaustionFondo);
			this.addChild(exhaustionBarra);
			this.addChild(exhaustionTri);
			
			portaChapas.x = 1024 - portaChapas.width; //Portachapas derecho superior, contiene los tornillos que se han recogido (de momento)
			portaChapas.y = 20;
			this.addChild(portaChapas);
			screwImage.scaleX = 0.75;
			screwImage.scaleY = 0.75;
			screwImage.x = 1024 - portaChapas.width + 40;
			screwImage.y = 25;
			screwText.x = 1024 - portaChapas.width + 50;
			screwText.y = 40;
			screwText.hAlign = HAlign.RIGHT;
			this.addChild(screwImage);
			this.addChild(screwText);
			
			// llamar a collectiblecounter desde character o tutorial con lo de parent
			
			/*contadorPiezasOli.x = 1024 - contadorPiezasOli.width;
			contadorPiezasOli.y = 160;
			this.addChild(contadorPiezasOli);
			
			if (Character.collectibleCounter == 0) 
			{ 
				contadorPiezasOli = new Image(Media.getTexture("OliCollect1")); 
			}
			if (Character.collectibleCounter == 1) 
			{ 
				contadorPiezasOli = new Image(Media.getTexture("OliCollect2")); 
			}
			if (Character.collectibleCounter == 2) 
			{ 
				contadorPiezasOli = new Image(Media.getTexture("OliCollect3")); 
			}
			if (Character.collectibleCounter == 3) 
			{ 
				contadorPiezasOli = new Image(Media.getTexture("OliCollect1")); 
			}
			if (Character.collectibleCounter == 4) 
			{ 
				contadorPiezasOli = new Image(Media.getTexture("OliCollect5")); 
			}*/
		}
		
		public function update(x:int):void 
		{
			energiaImagen.x = x;
			vidaImagenFondo.x = x + 7; //El 7 es la diferencia de posición respecto a energiaImagen, ya que cada una tiene un ancho ^^'
			vidaImagen.x = x + 8; //Same as above
			exhaustionFondo.x = x + 55;
			exhaustionBarra.x = x + 56;
			exhaustionTri.x = x + exhaustionBarra.width + 56;
			portaChapas.x = x + 1004-portaChapas.width;
			//Para añadir mas objetos, basta con poner x + la posicion suya original - 20 
			screwImage.x = x + 1004 - portaChapas.width + 40;
			screwText.x = x + 1004 - portaChapas.width + 50;
		}
		
		
		public function actualizarTamaño():void //Esta debe ser la función que modifique el tamaño a la barra de energia y/o la barra de exhaustion
		{
			
			//****MODIFICAR TAMAÑO BARRA ENERGIA****//
			//vidaImagen.height = (vidaImagenAltIni * Character.energyChar) / 100; 
			//vidaImagen.y += vidaImagenAltIni - vidaImagen.height ;
			
			//****MODIFICAR TAMAÑO BARRA CANSANCIO****//
			//exhaustionBarra.width = (168 * cansancio(0-100)) / 100; 
		}
	}

}