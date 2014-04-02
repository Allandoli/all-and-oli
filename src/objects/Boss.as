package objects 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Adrian
	 */
	public class Boss extends Sprite 
	{
		private var health:int;
		private var skin:int;
		private var bossType:int;//1 grua,2 general, 3 Boss
		
		public function Boss(type:int) 
		{
			super();
			bossType = type;
		}
		
		public function atack():void
		{
			
		}
		
	}

}