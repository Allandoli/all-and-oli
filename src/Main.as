package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	
	/**
	 * ...
	 * @author 
	 */
	
	[SWF(frameRate="60", width="1024", height="600", backgroundColor="0x333333")]
	 
	public class Main extends Sprite 
	{
		private var myStarling:Starling;
		
		public function Main():void 
		{
			
			myStarling = new Starling(MainMenu, stage, null, null, "auto", "baseline");
			myStarling.start();
		}
		
	}
	
}