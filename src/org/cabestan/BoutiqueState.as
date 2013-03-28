package org.cabestan
{
	import org.flixel.*;
	
	public class BoutiqueState extends FlxState
	{
		[Embed(source="../assets/logo.png")] private var Logo:Class;
		private var _logo:FlxSprite;
		private var _MenuText: FlxText;
		private var score:FlxText;
		private var _scoreText: FlxText;
		private var btnMenu:FlxButton;
		private var btnPlay:FlxButton;
		
		override public function create():void
		{
			FlxG.mouse.show();
			FlxG.bgColor = 0xFFFFFFFF;
			_logo = new FlxSprite(90,10);
			_logo.loadGraphic(Logo);
			add(_logo);
			
			_MenuText = new FlxText(0,400, FlxG.width, "Boutique de Cabestan");					
			_MenuText.setFormat(null, 16, 0xFF000000, "center");
			add(_MenuText);
			
			_scoreText = new FlxText(-200,100, FlxG.width, "Votre argent :\n");					
			_scoreText.setFormat(null, 16, 0xFF000000, "center");
			add(_scoreText);
			
			score = new FlxText(0, 0, 100);
			score.x = 100;
			score.y = 120;
			score.color = 0xff000000;
			score.shadow = 0xffFFFFFF;
			score.size = 20;
			
			
			
			btnPlay = new FlxButton(FlxG.width/2-40,FlxG.height/3+54, "Jouer",startGame);
			add(btnPlay);
			
			btnMenu = new FlxButton(FlxG.width/2-40,FlxG.height/3+54, "Menu Principal",startMenu);
			add(btnPlay);
			
			super.create();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function startGame():void
		{
			FlxG.switchState(new PlayState());
		}
		
		

		public function startMenu():void
		{
			FlxG.switchState(new MenuState());
		}
	}
}