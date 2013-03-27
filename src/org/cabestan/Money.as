package org.cabestan
{
	import org.flixel.FlxSprite;
	
	public class Money extends FlxSprite
	{
		[Embed(source="../../../../assets/Money.png")] private var ImgMoney:Class;
		
		public function Money(X:Number=0, Y:Number=0)
		{
			//TODO: implement function
			super(X, Y,ImgMoney);
			velocity.x = - 200;
		}
		
		override public function update():void
		{
			
		}
	}
}