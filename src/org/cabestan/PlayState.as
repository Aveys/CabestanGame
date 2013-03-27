package org.cabestan
{
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		private var _moneys:FlxGroup;
		private var _spawnTimer: Number;
		private var _spawnInterval: Number = 2.5;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF33CCFF;

			_moneys = new FlxGroup();
			add(_moneys);
			resetSpawnTimer();
			super.create();
		}
		
		override public function update():void
		{
			_spawnTimer -= FlxG.elapsed;
			
			if(_spawnTimer < 0.1)
			{
				spawnMoney();
				resetSpawnTimer();
			}
				super.update();
		}
		
		private function spawnMoney():void
		{
			var x:Number = FlxG.width;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			_moneys.add(new Money(x,y));
		}
		
		private function resetSpawnTimer():void
		{
			_spawnTimer = _spawnInterval;			
			_spawnInterval *= 0.95;
			if(_spawnInterval < 0.1)
			{
				_spawnInterval = 0.1;
			}
		}
	}
}