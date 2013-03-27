package {	
	import org.flixel.*;
	import org.cabestan.*;
	
	[SWF(width="640", height="480", backgroundColor="#33CCFF")]
	[Frame(factoryClass="Preloader")]
	
	public class Cabestan extends FlxGame
	{
		public function Cabestan():void
		{
			super(640, 480, PlayState, 1);
		}
	}
}