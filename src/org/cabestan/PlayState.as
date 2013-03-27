package org.cabestan
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var _Moneys:FlxGroup;
		
		override public function create():void
		{
			
			_Moneys = new FlxGroup();
			add(_Moneys);
			
			super.create();
		}
		
		private function SpawnMoney():void
		{
			var x:Number = FlxG.width;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			_Moneys.add(new Money(x,y));
		}
	}
}