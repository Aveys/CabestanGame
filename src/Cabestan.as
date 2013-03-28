package {	
	import org.cabestan.BoutiqueState;
	import org.cabestan.MenuState;
	import org.flixel.*;
	
	[SWF(width="640", height="480", backgroundColor="#33CCFF")]
	[Frame(factoryClass="Preloader")]
	
	public class Cabestan extends FlxGame
	{
		public function Cabestan():void
		{
			super(640, 480, MenuState, 1);
			//super(640,480,BoutiqueState,1);
		}
	}
}