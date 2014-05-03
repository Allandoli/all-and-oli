package objects 
{
	import flash.events.KeyboardEvent;
	import starling.display.Sprite;
	
	/**
	 * ...
	 * @author Adrian
	 */
	public class Station extends Sprite 
	{
		
		private var activeStation:starling.events.KeyboardEvent;
		
		public function Station() //clase para las estaciones de recarga
		{
			super();
			
		}
		
		public function openStation(e:starling.events.KeyboardEvent):void
		{
			var aux:String =  String.fromCharCode(e.charCode);
			if ( aux == "a" || aux == "A") // AND posicion x del jugador = station
			{
				activeStation = true;
				
				// pop up el menu de la tienda
			}
		}
		
	}

}