package org.cabestan
{
	import org.flixel.FlxSprite;
	
	public class Etoile extends FlxSprite
	{
		[Embed(source="../assets/etoileJaune.png")] private var imgEtoileJaune:Class;
		[Embed(source="../assets/etoileNoire.png")] private var imgEtoileNoire:Class;
		private var img:Class;
		
		private var Type:Number;
		public function Etoile(X:Number, Y:Number,Type:Number)
		{
			//TODO: implement function
			if(Type == 1)
				img = imgEtoileJaune;	
			else
				img = imgEtoileNoire;
				
			super(X, Y,img);
		}
	}
}