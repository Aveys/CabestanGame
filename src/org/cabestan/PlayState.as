package org.cabestan
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		//attributs de sprite
		private var _boat:Boat;
		
		
		override public function create():void{
		 	FlxG.score=0;
			
			//Déclaration des objets
			_boat = new Boat(50,FlxG.height/2);
			
			//ajout à l'écran
			add(_boat);	
		}
	}
}