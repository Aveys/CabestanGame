package org.cabestan
{
	import org.flixel.*;

	
	public class PlayState extends FlxState
	{
		//attributs de sprite
		private var _boat:Boat;
		private var _moneys:FlxGroup;
		private var _etoile:Etoile;
		private var score:FlxText;
		private var _obstcales:FlxGroup;
		
		private var _spawnEtoileTimer:Number;
		private var _spawnEtoileInterval: Number = 30;
		
		private var _spawnObstacleTimer:Number;
		private var _spawnObstacleInterval: Number=1.5;
		
		private var _spawnTimer: Number;
		
		private var _spawnInterval: Number = 0.5;
		private var _spawnIntervalJaune: Number = 0.1;
		private var _spawnIntervalNoir: Number = 3;
		
		private var _typeEtoile:Number;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFF33CCFF;

			_moneys = new FlxGroup();
			add(_moneys);
			
			_obstcales = new FlxGroup();
			add(_obstcales);
			
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
			resetSpawnEtoileTimer();
			resetSpawnTimer();
			resetSpawnObstacleTimer();
			super.create();
			
		}
		
		override public function update():void
		{
			score.text=FlxG.score+" $"
			FlxG.overlap(_boat,_moneys,hitBoatMoneys);
			FlxG.overlap(_boat,_etoile,hitBoatEtoile);
			
			_spawnTimer -= FlxG.elapsed;
			_spawnEtoileTimer -= FlxG.elapsed;
			_spawnObstacleTimer -= FlxG.elapsed;
			
			if(_spawnEtoileTimer < 0.1)
			{
				spawnEtoile();
				resetSpawnEtoileTimer();
			}

			if(_spawnObstacleTimer < 0.1)
			{
				spawnObstacle();
				resetSpawnObstacleTimer();
			}
			
			if(_spawnTimer < 0.1)
			{
				if(_typeEtoile == 1)
				{
					resetSpawnTimerJaune();
					spawnMoney();
				}
				else if(_typeEtoile == 0)
				{
					resetSpwanTimerNoir();
					spawnMoney();
				}
				else
				{
					resetSpawnTimer();
					spawnMoney();
				}
			}
				super.update();
			
		}
			
		public function hitBoatMoneys(boat:Boat,money:Money):void{
			money.kill();
			FlxG.score+=10;
		}
		
		public function hitBoatEtoile(boat:Boat,_etoile:Etoile):void{
			if(_etoile.type == 1)
			{
				resetSpawnTimerJaune();}
			else
			{resetSpwanTimerNoir();
			}
			_typeEtoile = _etoile.type;
			_etoile.kill();
			_etoile.destroy();
		}
		private function spawnMoney():void
		{
			var x:Number = FlxG.width + Math.random() * 200;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			_moneys.add(new Money(x,y));
		}
		
		private function spawnEtoile():void
		{
			var x:Number = FlxG.width;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			_etoile = new Etoile(x,y,Math.round(Math.random()));
			add(_etoile);
		}
		
		private function spawnObstacle():void
		{
			var x:Number = FlxG.width + Math.random() * 200;
			var y:Number = Math.random() * (FlxG.height - 100) + 50;
			_obstcales.add(new Obstacle(x,y));
		}
		
		
		private function resetSpawnObstacleTimer():void {_spawnObstacleTimer = _spawnObstacleInterval;}
		
		private function resetSpawnEtoileTimer():void {_spawnEtoileTimer = _spawnEtoileInterval}
		
		private function resetSpawnTimer():void {_spawnTimer = _spawnInterval;}
		
		private function resetSpawnTimerJaune():void {_spawnTimer = _spawnIntervalJaune;}
			
		private function resetSpwanTimerNoir():void {_spawnTimer = _spawnIntervalNoir;}
	}
}
