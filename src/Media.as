package  
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	import starling.textures.Texture;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author
	 */
	public class Media 
	{
		static private var gameTextures:Dictionary = new Dictionary();
		
		[Embed(source = "../media/images/BgWelcome.jpg")]
		public static const BgWelcome:Class;
		
		[Embed(source = "../media/images/BgGame.jpg")]
		public static const BgGame:Class;
		
		[Embed(source = "../media/images/BgEnd.jpg")]
		public static const BgEnd:Class;
		
		[Embed(source = "../media/images/BgCredits.jpg")]
		public static const BgCredits:Class;
		
		[Embed(source = "../media/images/PlayButton.png")]
		public static const PlayButton:Class;
		
		[Embed(source = "../media/images/StartButton.jpg")]
		public static const StartButton:Class;
		
		[Embed(source = "../media/images/CreditsButton.jpg")]
		public static const CreditsButton:Class;
		
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