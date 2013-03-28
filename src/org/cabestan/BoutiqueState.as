package org.cabestan
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class BoutiqueState extends FlxState
	{
		[Embed(source="../assets/logo.png")] private var Logo:Class;
		[Embed(source="../assets/btnBarque.png")] private var BoatA:Class;
		[Embed(source="../assets/btnBateaub.png")] private var BoatB:Class;
		[Embed(source="../assets/btnBateauc.png")] private var BoatC:Class;
		
		private var _logo:FlxSprite;
		private var _MenuText: FlxText;
		private var score:FlxText;
		private var _scoreText: FlxText;
		private var choose:FlxText;
		
		private var ImageA:FlxSprite;
		private var ImageB:FlxSprite;
		private var ImageC:FlxSprite;
		private var selection:FlxSprite;
		
		private var selectA:FlxButtonPlus;
		private var selectB:FlxButtonPlus;
		private var selectC:FlxButtonPlus;
		
		private var btnMenu:FlxButtonPlus;
		private var btnPlay:FlxButtonPlus;
		private var btnBateauA:FlxButtonPlus;
		private var btnBateauB:FlxButtonPlus;
		private var btnBateauC:FlxButtonPlus;
		
		override public function create():void
		{
			FlxG.TypeBateau = 0;
			FlxG.mouse.show();
			FlxG.bgColor = 0xFFFFFFFF;
			_logo = new FlxSprite(90,10);
			_logo.loadGraphic(Logo);
			add(_logo);
			
			_MenuText = new FlxText(0,420, FlxG.width, "Boutique de Cabestan");					
			_MenuText.setFormat(null, 16, 0xFF000000, "center");
			add(_MenuText);
			
			initButton();
			initBtnBoat();
			
			/*_scoreText = new FlxText(-200,100, FlxG.width, "Votre argent :\n");					
			_scoreText.setFormat(null, 16, 0xFF000000, "center");
			add(_scoreText);
			
			score = new FlxText(0, 0, 100);
			score.text = FlxU.formatMoney(FlxG.score)+" $";
			score.x = 100;
			score.y = 120;
			score.color = 0xff000000;
			score.shadow = 0xffFFFFFF;
			score.size = 20;
			*/
			
			

			super.create();
		}
		
		override public function update():void
		{
			
			if(FlxG.TypeBateau == 0)
				btnPlay.active = false;
			else
				btnPlay.active = true;
			
			super.update();
		}
		
		public function initButton():void
		{
			btnPlay = new FlxButtonPlus(30,FlxG.height-75,startGame,null, "Jouer",150,40);
			btnPlay.borderColor = 1;
			btnPlay.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnPlay.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnPlay);
			
			btnMenu = new FlxButtonPlus(FlxG.width-180,FlxG.height-75,startMenu,null, "Menu Principal",150,40);
			btnMenu.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnMenu.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnMenu);
			
			btnBateauA = new FlxButtonPlus(10,10,startBoat,null, "Bateau A",150,40);
			btnBateauA.ID =1;
			btnBateauA.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBateauA.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBateauA);
			
			btnBateauB = new FlxButtonPlus(10,60,startBoat,null, "Bateau B",150,40);
			btnBateauB.ID =2;
			btnBateauB.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBateauB.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBateauB);
			
			btnBateauC = new FlxButtonPlus(10,110,startBoat,null, "Bateau C",150,40);
			btnBateauC.ID =3;
			btnBateauC.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBateauC.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBateauC);
			
		}
		
		public function initBtnBoat():void
		{
			ImageA = new FlxSprite();
			ImageA.loadGraphic(BoatA);
			ImageB = new FlxSprite();
			ImageB.loadGraphic(BoatB);
			ImageC = new FlxSprite();
			ImageC.loadGraphic(BoatC);
			
			selectA = new FlxButtonPlus(FlxG.width/2 - 80,FlxG.height- 120,selectType,null,"",40,40);
			selectA.loadGraphic(ImageA,ImageA);
			add(selectA);
			selectB = new FlxButtonPlus(FlxG.width/2-20,FlxG.height- 120,selectType,null,"",40,40);
			selectB.loadGraphic(ImageB,ImageB);
			add(selectB);
			selectC = new FlxButtonPlus(FlxG.width/2 + 40,FlxG.height- 120,selectType,null,"",40,40);
			selectC.loadGraphic(ImageC,ImageC);
			add(selectC);
			
			choose = new FlxText(FlxG.width/2-150,FlxG.height - 150,300,"Choisis ton bateau !");
			choose.setFormat(null, 16, 0xFF000000, "center");
			add(choose);
		}
		
		public function selectType():void
		{
			selection = new FlxSprite(FlxG.width/2 - 80,FlxG.height- 120);
			selection.makeGraphic(40,40,0xffFFFF00);
			add(selection);
		}
		
		public function startGame():void
		{
			
			FlxG.switchState(new PlayState());
		}
		
		public function startBoat():void
		{
			
			FlxG.switchState(new BoatState());
			
		}
		

		public function startMenu():void
		{
			FlxG.switchState(new MenuState());
		}
	}


}
