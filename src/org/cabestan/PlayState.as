package org.cabestan
{
	import org.flixel.*;

	
	public class PlayState extends FlxState
	{
		//attributs de sprite
		private var _boat:Boat;
		private var _moneys:FlxGroup;
		
		private var score:FlxText;
		private var _spawnTimer: Number;
		private var _spawnInterval: Number = 2.5;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF33CCFF;

			_moneys = new FlxGroup();
			add(_moneys);
			
			//Déclaration des objets
			_boat = new Boat(50,FlxG.height/2);
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = FlxU.formatMoney(FlxG.score)+" $";
			
			//ajout à l'écran
			add(_boat);
			add(score)
			
			resetSpawnTimer();
			super.create();
		}
		
		override public function update():void
		{
			score.text=FlxG.score+" $"
			FlxG.overlap(_boat,_moneys,hitBoatMoneys);
			_spawnTimer -= FlxG.elapsed;

			if(_spawnTimer < 0.1)
			{
				spawnMoney();
				resetSpawnTimer();
			}
				super.update();
		}
		public function hitBoatMoneys(boat:Boat,money:Money):void{
			money.kill();
			FlxG.score+=10;
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
