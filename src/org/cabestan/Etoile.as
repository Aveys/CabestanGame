package org.cabestan
{
	import org.flixel.FlxSprite;
	
	public class Etoile extends FlxSprite
	{
		[Embed(source="../assets/etoileJaune.png")] private var imgEtoileJaune:Class;
		[Embed(source="../assets/etoileNoire.png")] private var imgEtoileNoire:Class;
		private var img:Class;
		
		public var type:Number;
		public function Etoile(X:Number, Y:Number,type:Number)
		{
			//TODO: implement function
			if(type == 1)
				img = imgEtoileJaune;	
			else
				img = imgEtoileNoire;
				
			super(X, Y,img);
			this.type = type;
			velocity.x = - 300;
		}
		
		override public function update():void
		{
			if(this.x<-50){
				this.kill();
				this.destroy();}
			
			velocity.y = Math.cos(x / 50) * 50;
			super.update();
		}
	}
}