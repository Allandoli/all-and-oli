package objects 
{
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Enemy extends Sprite 
	{
		private var positionX:int;
		private var health:int;
		private var skin:Image;
		private var movement:MovieClip;//animacionas para andar
		private var positionX:int;
		private var enemyType:int;//1 mordedor, 2 volador, 3 aspiradora, 4 olla, 5 robot imanes
		
		public function Enemy(type:int) 
		{
			super();
			enemyType = type;
		}
		
		public function follow():void // posible idea para que los enemigos te sigan
		{
			if (this.positionX-Character.positionx>150) 
			{
				atack();
				if (this.positionX>Character.positionx) 
				{
					this.positionX --;
				}
				else 
				{
					this.positionX++;
				}
			}
		}
		private function atack():void
		{
			//cambio de imagen
		}
		
	}

}