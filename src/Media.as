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
		static private var gameTextures:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/BgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source = "../media/images/BgTutorial.png")]
		public static const BgTutorial:Class;
		
		[Embed(source = "../media/images/BgEnd.jpg")]
		public static const BgEnd:Class;
		
		[Embed(source = "../media/images/BgCredits.jpg")]
		public static const BgCredits:Class;
		
		[Embed(source = "../media/images/CreditsButton.jpg")]
		public static const CreditsButton:Class;
		
		[Embed(source = "../media/images/AllButton.png")]
		public static const AllButton:Class;
		
		[Embed(source = "../media/images/OliButton.png")]
		public static const OliButton:Class;
		
		[Embed(source = "../media/images/SueloTutorial.png")]
		public static const SueloTutorial:Class;
		
		public static var CharTextureAtlas:TextureAtlas;
		public static var CharTexture:Dictionary = new Dictionary();
		
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