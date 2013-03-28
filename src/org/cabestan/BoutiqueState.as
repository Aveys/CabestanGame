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
		[Embed(source="../assets/btnBarqueSelect.png")] private var BoatASelect:Class;
		[Embed(source="../assets/btnBateaubSelect.png")] private var BoatBselect:Class;
		[Embed(source="../assets/btnBateaucSelect.png")] private var BoatCselect:Class;
		
		private var _logo:FlxSprite;
		private var _MenuText: FlxText;
		private var score:FlxText;
		private var _scoreText: FlxText;
		private var choose:FlxText;
		private var advert:FlxText;
		
		private var ImageA:FlxSprite;
		private var ImageB:FlxSprite;
		private var ImageC:FlxSprite;
		private var ImageASelect:FlxSprite;
		private var ImageBSelect:FlxSprite;
		private var ImageCSelect:FlxSprite;
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
			FlxG.mouse.show();
			FlxG.bgColor = 0xFFFFFFFF;
			_logo = new FlxSprite(90,10);
			_logo.loadGraphic(Logo);
			add(_logo);
			
			_MenuText = new FlxText(0,420, FlxG.width, "Boutique de Cabestan");					
			_MenuText.setFormat(null, 16, 0xFF000000, "center");
			add(_MenuText);
			
			initBtnBoat();
			initButton();
			
			advert = new FlxText(FlxG.width - 150,FlxG.height - 150,100,"Vous devez achetez ce bateau pour l'utiliser !");
			advert.setFormat(null, 16, 0xFF000000, "center");

			
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
			
			btnBateauA = new FlxButtonPlus(10,10,startBoat,[1], "Bateau A",150,40);
			btnBateauA.ID =1;
			btnBateauA.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBateauA.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBateauA);
			
			btnBateauB = new FlxButtonPlus(10,60,startBoat,[2], "Bateau B",150,40);
			btnBateauB.ID =2;
			btnBateauB.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBateauB.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBateauB);
			
			btnBateauC = new FlxButtonPlus(10,110,startBoat,[3], "Bateau C",150,40);
			btnBateauC.ID =3;
			btnBateauC.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBateauC.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBateauC);
			
		}
		
		public function initBtnBoat():void
		{
			ImageASelect = new FlxSprite(FlxG.width/2 - 80,FlxG.height- 120);
			ImageASelect.loadGraphic(BoatASelect);
			ImageBSelect = new FlxSprite(FlxG.width/2-20,FlxG.height- 120);
			ImageBSelect.loadGraphic(BoatBselect);
			ImageCSelect = new FlxSprite(FlxG.width/2 + 40,FlxG.height- 120);
			ImageCSelect.loadGraphic(BoatCselect);
			
			ImageA = new FlxSprite();
			ImageA.loadGraphic(BoatA);
			ImageB = new FlxSprite();
			ImageB.loadGraphic(BoatB);
			ImageC = new FlxSprite();
			ImageC.loadGraphic(BoatC);
			
			selectA = new FlxButtonPlus(FlxG.width/2 - 80,FlxG.height- 120,selectType,[1],"",40,40);
			selectA.loadGraphic(ImageA,ImageASelect);
			add(selectA);
			selectB = new FlxButtonPlus(FlxG.width/2-20,FlxG.height- 120,selectType,[2],"",40,40);
			selectB.loadGraphic(ImageB,ImageBSelect);
			add(selectB);
			selectC = new FlxButtonPlus(FlxG.width/2 + 40,FlxG.height- 120,selectType,[3],"",40,40);
			selectC.loadGraphic(ImageC,ImageCSelect);
			add(selectC);
			
			choose = new FlxText(FlxG.width/2-150,FlxG.height - 150,300,"Choisis ton bateau !");
			choose.setFormat(null, 16, 0xFF000000, "center");
			add(choose);
		}
		
		public function selectType(type:Number):void
		{
			
			if(type == 1 && FlxG.IsBoughtA ==true)
			{
			FlxG.TypeBateau =1;
			selectA.loadGraphic(ImageASelect,ImageASelect);
			selectB.loadGraphic(ImageB,ImageB);
			selectC.loadGraphic(ImageC,ImageC);
			
			}else if(type == 2 && FlxG.IsBoughtB ==true)
			{
			FlxG.TypeBateau =2;
			selectA.loadGraphic(ImageA,ImageA);
			selectB.loadGraphic(ImageBSelect,ImageBSelect);
			selectC.loadGraphic(ImageC,ImageC);
			}else if(type == 3 && FlxG.IsBoughtC ==true)
			{
			FlxG.TypeBateau =3;
			selectA.loadGraphic(ImageA,ImageA);
			selectB.loadGraphic(ImageB,ImageB);
			selectC.loadGraphic(ImageCSelect,ImageCSelect);
			}else
				add(advert);

		}
		
		public function startGame():void
		{
			
			FlxG.switchState(new PlayState());
		}
		
		public function startBoat(type:Number):void
		{
			FlxG.TypeBateau = type;
			FlxG.switchState(new BoatState());
			
		}
		

		public function startMenu():void
		{
			FlxG.switchState(new MenuState());
		}
	}


}
