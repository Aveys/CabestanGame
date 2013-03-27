package org.cabestan
{
	import org.flixel.FlxSprite;
	
	public class Obstacle extends FlxSprite
	{
		[Embed(source="../assets/baigneur.png")] private var imgBaigneur:Class;
		[Embed(source="../assets/arbre.png")] private var imgArbre:Class;
		[Embed(source="../assets/rock.png")] private var imgRock:Class;

		
		public function Obstacle(X:Number, Y:Number)
		{
		var typeObstacle:Number;
		var Obstacle:Class;
			//TODO: implement function
		typeObstacle = Math.random();
		if(typeObstacle < 0.3)
			Obstacle = imgBaigneur
		else if(typeObstacle >0.7)
			Obstacle = imgRock;
		else
			Obstacle = imgArbre;
		
		super(X,Y,Obstacle);
		velocity.x = - 200;
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}