package events 
{
	import starling.events.Event;
	
	/**
	 * ...
	 * @author Vicent
	 */
	
	public class CharacterEvent extends Event 
	{
		public static const CHANGE_CHAR:String = "changeCharacter";
		
		public var params:Object;
		
		public function CharacterEvent(type:String, _params:Object = null, bubbles:Boolean=false, data:Object=null) 
		{
			super(type, bubbles, data);
			this.params = _params;
			
		}
		
	}

}