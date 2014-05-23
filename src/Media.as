package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import flash.display.BitmapData;
	import starling.textures.TextureAtlas;
	
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
		
		[Embed(source = "../media/images/BgEnd.jpg")]
		public static const BgEnd:Class;
		
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
		
		[Embed(source = "../media/images/PlatTutoA2.png")]
		public static const PlatTutoA2:Class;
		
		[Embed(source = "../media/images/PlatTutoS1.png")]
		public static const PlatTutoS1:Class;
		
		[Embed(source = "../media/images/PlatTutoS2.png")]
		public static const PlatTutoS2:Class;
		
		[Embed(source = "../media/images/chapaoli.png")]
		public static const chapaoli:Class;		
		
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
		
		public static var CharTextureAtlas:TextureAtlas;
		static private var gameTextures:Dictionary = new Dictionary();
		
		[Embed(source = "../media/spritesheets/CharSheet.png")]
		public static const AtlasChar:Class;
		
		[Embed(source = "../media/spritesheets/CharSheet.xml", mimeType="application/octet-stream")]
		public static const AtlasCharXML:Class;
		
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