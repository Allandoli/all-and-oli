package objects 
{
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Vicent
	 */
	public class Enemy extends Sprite 
	{
		private var positionX;
		// spawn
		// vida
		// attack
		// movimiento/perseguir
		// image
		
		public function Enemy() 
		{
			super();
			follow();
		}
		
		public function follow():void // posible idea para que los enemigos te sigan
		{
			if (this.positionX-Character.positionx>150) 
			{
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
		
	}

}