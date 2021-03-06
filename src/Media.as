package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import flash.display.BitmapData;
	import starling.textures.TextureAtlas;
	import flash.media.Sound;
	
	/**
	 * ...
	 * @author
	 */
	public class Media 
	{
		
		[Embed(source = "../media/images/BgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source = "../media/images/BgTutorial.png")]
		public static const BgTutorial:Class;
		
		[Embed(source = "../media/images/BgTutorial1.png")]
		public static const BgTutorial1:Class;
		
		[Embed(source = "../media/images/BgTutorial2.png")]
		public static const BgTutorial2:Class;
		
		[Embed(source = "../media/images/fondogracias.png")]
		public static const BgEnd:Class;
		
		[Embed(source = "../media/images/fondoteclas.png")]
		public static const BgTeclas:Class;
		
		[Embed(source = "../media/images/BgCredits.jpg")]
		public static const BgCredits:Class;
		
		[Embed(source = "../media/images/CreditsButton.png")]
		public static const CreditsButton:Class;
		
		[Embed(source = "../media/images/PlayButton.png")]
		public static const PlayButton:Class;
		
		[Embed(source = "../media/images/OliButton.png")]
		public static const OliButton:Class;
		
		[Embed(source = "../media/images/titulo.png")]
		public static const titulo:Class;
		
		[Embed(source = "../media/images/SueloTutorial.png")]
		public static const SueloTutorial:Class;
		
		[Embed(source = "../media/images/PlatTutoA1.png")]
		public static const PlatTutoA1:Class;
		
		[Embed(source = "../media/images/PlatTutoA2.png")]
		public static const PlatTutoA2:Class;
		
		[Embed(source = "../media/images/PlatTutoS1.png")]
		public static const PlatTutoS1:Class;
		
		[Embed(source = "../media/images/PlatTutoS2.png")]
		public static const PlatTutoS2:Class;
		
		[Embed(source = "../media/images/PlatTutoS3.png")]
		public static const PlatTutoS3:Class;
		
		[Embed(source = "../media/images/PlatTutoS4.png")]
		public static const PlatTutoS4:Class;
		
		[Embed(source = "../media/images/chapaoli.png")]
		public static const chapaoli:Class;		
		
		[Embed(source = "../media/images/bateria.png")]
		public static const bateria:Class;		
		
		[Embed(source = "../media/images/carburador.png")]
		public static const carburador:Class;		
		
		[Embed(source = "../media/images/gasoil.png")]
		public static const gasoil:Class;		
		
		[Embed(source = "../media/images/litio.png")]
		public static const litio:Class;
		
		[Embed(source = "../media/images/exhaustionfondo.png")]
		public static const exhaustionfondo:Class;
		
		[Embed(source = "../media/images/exhaustionbarra.png")]
		public static const exhaustionbarra:Class;
		
		[Embed(source = "../media/images/exhaustiontri.png")]
		public static const exhaustiontri:Class;
		
		[Embed(source = "../media/images/portachapas.png")]
		public static const portachapas:Class;	
		
		[Embed(source = "../media/images/chapaall.png")]
		public static const chapaall:Class;			
		
		[Embed(source = "../media/images/fondomenu.png")]
		public static const fondomenu:Class;		
		
		[Embed(source = "../media/images/allmenu.png")]
		public static const allmenu:Class;		
		
		[Embed(source = "../media/images/olimenu.png")]
		public static const olimenu:Class;
		
		[Embed(source = "../media/images/Screw1.png")]
		public static const Screw1:Class;
		
		[Embed(source = "../media/images/Screw2.png")]
		public static const Screw2:Class;
		
		[Embed(source = "../media/images/Screw3.png")]
		public static const Screw3:Class;
		
		[Embed(source = "../media/images/Screw4.png")]
		public static const Screw4:Class;
		
		[Embed(source = "../media/images/OliCollect1.png")]
		public static const OliCollect1:Class;
		
		[Embed(source = "../media/images/OliCollect2.png")]
		public static const OliCollect2:Class;
		
		[Embed(source = "../media/images/OliCollect3.png")]
		public static const OliCollect3:Class;
		
		[Embed(source = "../media/images/OliCollect4.png")]
		public static const OliCollect4:Class;
		
		[Embed(source = "../media/images/OliPiezas1.png")]
		public static const OliPiezas1:Class;
		
		[Embed(source = "../media/images/OliPiezas2.png")]
		public static const OliPiezas2:Class;
		
		[Embed(source = "../media/images/OliPiezas3.png")]
		public static const OliPiezas3:Class;
		
		[Embed(source = "../media/images/OliPiezas4.png")]
		public static const OliPiezas4:Class;
		
		[Embed(source = "../media/images/OliPiezas5.png")]
		public static const OliPiezas5:Class;
		
		public static var CharTextureAtlas:TextureAtlas;
		static private var gameTextures:Dictionary = new Dictionary();
		
		[Embed(source = "../media/spritesheets/CharSheet.png")]
		public static const AtlasChar:Class;
		
		[Embed(source = "../media/spritesheets/CharSheet.xml", mimeType="application/octet-stream")]
		public static const AtlasCharXML:Class;
		
		[Embed(source="../media/sounds/screw.mp3")]
		public static const ScrewSound:Class;
		
		public static function getAtlas():TextureAtlas
		{
			if (CharTextureAtlas == null)
			{
				var texture:Texture = getTexture("AtlasChar");
				var xml:XML = XML(new AtlasCharXML());
				CharTextureAtlas = new TextureAtlas(texture, xml);
			}
			return CharTextureAtlas;
		}
		
		public static function getTexture(name:String):Texture 
		{
			if (gameTextures[name] == undefined)
			{
				var bitmap:Bitmap = new Media[name]();
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			
			return gameTextures[name];
		}
		
		public function Media() 
		{
			
		}
	}
}