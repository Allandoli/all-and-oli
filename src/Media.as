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
		
		[Embed(source = "../media/images/StartButton.jpg")]
		public static const StartButton:Class;
		
		[Embed(source = "../media/images/CreditsButton.jpg")]
		public static const CreditsButton:Class;
		
		[Embed(source = "../media/images/AllButton.png")]
		public static const AllButton:Class;
		
		[Embed(source = "../media/images/OliButton.png")]
		public static const OliButton:Class;
		
		/*[Embed(source = "../media/images/All.png")]
		public static const All:Class;
		
		[Embed(source = "../media/images/AllLeft.png")]
		public static const AllLeft:Class;
		
		[Embed(source = "../media/images/AllRight.png")]
		public static const AllRight:Class;
		
		[Embed(source = "../media/images/AllJump.png")]
		public static const AllJump:Class;
		
		[Embed(source = "../media/images/Oli.png")]
		public static const Oli:Class;
		
		[Embed(source = "../media/images/OliLeft.png")]
		public static const OliLeft:Class;
		
		[Embed(source = "../media/images/OliRight.png")]
		public static const OliRight:Class;
		
		[Embed(source = "../media/images/OliJump.png")]
		public static const OliJump:Class;*/
		
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