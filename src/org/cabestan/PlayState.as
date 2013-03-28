package org.cabestan
{
	import flashx.textLayout.compose.ISWFContext;
	
	import org.flixel.*;
	import org.flixel.system.debug.Log;


	
	public class PlayState extends FlxState
	{
		[Embed(source="../assets/coin.mp3")] private var Coin:Class;
		public var coinFX:FlxSound;
		[Embed(source="../assets/explode.mp3")] private var Explode:Class;
		public var explodeFX:FlxSound;
		[Embed(source="../assets/powerup.mp3")] private var Powerup:Class;
		public var powerupFX:FlxSound;
		[Embed(source="../assets/select.mp3")] private var Select:Class;
		[Embed(source="../assets/logo.png")] private var Logo:Class;
		public var selectFX:FlxSound;
		
		//attributs de sprite
		private var _logo:FlxSprite;
		private var _boat:Boat;
		private var IsDead:Boolean = false;
		private var IsEtoile:Boolean = false;
		private var _moneys:FlxGroup;
		private var _etoile:Etoile;
		private var score:FlxText;
		private var _gameOverText: FlxText;
		private var _scoreText: FlxText;
		private var _obstacles:FlxGroup;
		
		private var _spawnInterval: Number = 0.5;
		private var _spawnIntervalJaune: Number = 0.1;
		private var _spawnIntervalNoir: Number = 2;
		private var _spawnEtoileInterval: Number = 3;
		private var _spawnObstacleInterval: Number=1.5;
		
		private var _spawnObstacleTimer:Number;
		private var _spawnEtoileTimer:Number;
		private var _spawnTimer: Number;

		private var _typeEtoile:Number;
		
		private var _time:Number=0;
		
		override public function create():void
		{

			FlxG.mouse.hide();
			FlxG.bgColor = 0xFF33CCFF;
			
			_moneys = new FlxGroup();
			add(_moneys);
			
			_obstacles = new FlxGroup();
			add(_obstacles);
			
			//declaration du son
			coinFX = new FlxSound();
			coinFX.loadEmbedded(Coin);
			explodeFX = new FlxSound();
			explodeFX.loadEmbedded(Explode);
			powerupFX = new FlxSound();
			powerupFX.loadEmbedded(Powerup);
			selectFX = new FlxSound();
			selectFX.loadEmbedded(Select);
			
			//Déclaration des objets
			_boat = new Boat(50,FlxG.height/2,FlxG.TypeBateau);
			score = new FlxText(0, 0, 100);
			score.color = 0xffffffff;
			score.shadow = 0xff000000;
			score.scrollFactor.x = 0;
			score.scrollFactor.y = 0;
			score.text = FlxU.formatMoney(FlxG.score)+" $";
			score.size = 20;
			
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
			
			if(FlxG.keys.ENTER && IsDead == true)
			{				
				FlxG.switchState(new BoutiqueState());
			}
			else if (FlxG.keys.Q)
			{
				FlxG.switchState(new BoutiqueState());
			}
						
				
			if(IsDead ==false)
			{
				FlxG.overlap(_boat,_moneys,hitBoatMoneys);
				FlxG.overlap(_boat,_etoile,hitBoatEtoile);
				FlxG.overlap(_boat,_obstacles,hitBoatObstacles);
				
				_spawnTimer -= FlxG.elapsed;
				_spawnEtoileTimer -= FlxG.elapsed;
				_spawnObstacleTimer -= FlxG.elapsed;
						
			
				if(_time  < 0.1)
				{
					IsEtoile = false;
				}
				
				
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
					if(_typeEtoile == 1 && IsEtoile == true)
					{	
						resetSpawnTimerJaune();
						spawnMoney();
						_time -= FlxG.elapsed;
					}
					else if(_typeEtoile == 0 && IsEtoile == true)
					{
						resetSpwanTimerNoir();
						spawnMoney();
						_time -= FlxG.elapsed;
					}
					else
					{
						{
							resetSpawnTimer();
							spawnMoney();
						}
					}
				}
			}

				super.update();
			
		}
			
		public function hitBoatMoneys(boat:Boat,money:Money):void{
			money.kill();
			FlxG.score+=10;
			coinFX.play(true);
		}
		
		public function hitBoatObstacles(boat:Boat,obstacles:Obstacle):void
		{	
			obstacles.kill()
			explodeFX.play(true);	
			IsDead = true;
			_gameOverText = new FlxText(0,400, FlxG.width, "Vous avez perdu\n Appuyer sur ENTRER pour accéder à la boutique de Cabestan !");					
			_gameOverText.setFormat(null, 16, 0xFF000000, "center");
			add(_gameOverText);
			FlxG.bgColor = 0xFFFFFFFF;
			_logo = new FlxSprite(90,10);
			_logo.loadGraphic(Logo);
			add(_logo);	
			
			_scoreText = new FlxText(-200,100, FlxG.width, "Votre argent :\n");					
			_scoreText.setFormat(null, 16, 0xFF000000, "center");
			add(_scoreText);

			score.x = 100;
			score.y = 120;
			score.color = 0xff000000;
			score.shadow = 0xffFFFFFF;
			score.size = 20;
			
			_moneys.kill();
			_boat.kill();
			_obstacles.kill();

		}

		
		public function hitBoatEtoile(boat:Boat,_etoile:Etoile):void{
			if(_etoile.type == 1)
			{
				resetSpawnTimerJaune();
				powerupFX.play(true);
			}
			else
			resetSpwanTimerNoir();
			
			IsEtoile = true;
			_time = 3;
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
			_obstacles.add(new Obstacle(x,y));
		}
		
		
		private function resetSpawnObstacleTimer():void 
		{
			_spawnObstacleTimer = _spawnObstacleInterval;
		}
		
		private function resetSpawnEtoileTimer():void {_spawnEtoileTimer = _spawnEtoileInterval}
		
		private function resetSpawnTimer():void {_spawnTimer = _spawnInterval;}
		
		private function resetSpawnTimerJaune():void {_spawnTimer = _spawnIntervalJaune;}
			
		private function resetSpwanTimerNoir():void {_spawnTimer = _spawnIntervalNoir;}
	}
}
