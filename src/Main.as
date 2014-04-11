package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import starling.core.Starling;
	import Box2D.Common.Math.b2Vec2;
	import com.reyco1.physinjector.PhysInjector;
    import com.reyco1.physinjector.data.PhysicsObject;
    import com.reyco1.physinjector.data.PhysicsProperties;
	
	/**
	 * ...
	 * @author 
	 */
	
	[SWF(frameRate="60", width="1024", height="600", backgroundColor="0x333333")]
	 
	public class Main extends Sprite 
	{
		public var myStarling:Starling;
		protected var physics:PhysInjector;
		
		public function Main():void 
		{
			
			myStarling = new Starling(MainMenu, stage, null, null, "auto", "baseline");
			myStarling.start();
		}
		
	}
	
}