package org.cabestan
{
	import flash.text.FontStyle;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FlxButtonPlus;
	
	public class BoatState extends FlxState
	{
		[Embed(source="../assets/image_Barque1.jpg")] private var BoatA:Class;
		[Embed(source="../assets/image_bateauB.jpg")] private var BoatB:Class;
		[Embed(source="../assets/image_bateauC.jpg")] private var BoatC:Class;
		[Embed(source="../assets/bg.png")] private var Bg:Class;
		
		private var _logo:FlxSprite;
		private var _desciption:FlxText;
		private var _Prix:FlxText;
		private var _bg:FlxSprite;
		
		private var _descriptionA:String;
		private var _descriptionB:String;
		private var _descriptionC:String;
		private var _description1:String;
		
		private var _prixA:Number;
		private var _prixB:Number;
		private var _prixC:Number;
		private var _prix1:Number;
		
		private var btnMenu:FlxButtonPlus;
		private var btnBuy:FlxButtonPlus;

		
		override public function create():void
		{
			_bg = new FlxSprite(0,0);
			_bg.loadGraphic(Bg);
			add(_bg);
			initText();
			FlxG.mouse.show();
			_logo = new FlxSprite(0,0);
			
			if(FlxG.TypeBateau == 1)
			{
				_logo.loadGraphic(BoatA);
				_description1 = _descriptionA;
				_prix1 = _prixA;

			}
			else if(FlxG.TypeBateau == 2)
			{
				_logo.loadGraphic(BoatB);
				_description1 = _descriptionB;
				_prix1 = _prixB;
			}
			else if(FlxG.TypeBateau == 3)
			{
				_logo.loadGraphic(BoatC);
				_description1 = _descriptionC;
				_prix1 = _prixC;
			}else
			{
				FlxG.switchState(new BoutiqueState());
				FlxG.TypeBateau =0;
			}
			
			_desciption = new FlxText(0,240,340,_description1);
			_desciption.color = 0xffFFFFFF;
			_desciption.size = 10;
			
			_Prix = new FlxText(FlxG.width/2,280,340,"Prix : "+ FlxU.formatMoney(_prix1) +" €");
			_Prix.color = 0xffFFFFFF;
			_Prix.alignment = "center";
			_Prix.size = 20;
			
			
			
			btnMenu = new FlxButtonPlus(FlxG.width/2+95,320,startMenu,null, "Boutique",150,40);
			btnMenu.borderColor = 1;
			btnMenu.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnMenu.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnMenu);
			
			btnBuy = new FlxButtonPlus(FlxG.width/2+95,380,BuyBoat,null, "Acheter",150,40);
			btnBuy.borderColor = 1;
			btnBuy.updateInactiveButtonColors([0xff3333FF,0xff3333FF]);
			btnBuy.updateActiveButtonColors([0xff33CCFF,0xff33CCFF]);
			add(btnBuy);
			
			add(_logo);	
			add(_Prix);
			add(_desciption);
			
			super.create();
		}
	public function startMenu():void
	{
		FlxG.TypeBateau = 0;
		FlxG.switchState(new BoutiqueState());
	}
	
	public function BuyBoat():void
	{
		if(FlxG.TypeBateau ==1 && FlxG.score >= 3000 )
		{	FlxG.score -= 3000;
			FlxG.IsBoughtA = true;
			FlxG.TypeBateau = 0;
			FlxG.switchState(new BoutiqueState());
		}else if(FlxG.TypeBateau ==2 && FlxG.score >= 7500)
		{	FlxG.score -= 7500;
			FlxG.IsBoughtB = true;	
			FlxG.TypeBateau = 0;
			FlxG.switchState(new BoutiqueState());
		}else if(FlxG.TypeBateau ==3 && FlxG.score >= 18000)
		{	FlxG.score -= 18000;
			FlxG.IsBoughtC = true;
			FlxG.TypeBateau = 0;
			FlxG.switchState(new BoutiqueState());
		}
		
		
	}
		
		
	public function initText():void
	{
		_descriptionA = "C'est le modèle le plus simple. Très dépouillé, la barque est destiné en principe à la peche.\n\n" +
						"L'aménagement est sommaire et comprend uniquement trois banquettes en bois.\n\n" +
						"Il est en en général vendu comme bateau de peche pour le pecheur non professionnel mais assidu.\n" +
						" Sa fonction est en fait peu determinée. Il est en effet, souvent utilisé comme bateau de peche,\n" +
						"mais également comme bateau promenade, voire, dans certains cas, comme moyen de locomotion dans les\n " +
						"bocages, en raison de son très faible tirant d'eau.\n" +
						"Caractéristiques :\n" +
						"• longueur : 4 m,\n" +
						"• poids : 250 KG,\n" +
						"• équipement : 3 banquettes en bois,\n" +
						"• possibilité moteur de faible puissance,\n" +
						"• système de traction : rame, godille ou moteur.\n";
		
		
	_descriptionB = "Plus spécialisé, le bateau classe \"B\" est destiné à la promenade en mer, lac, estuaire de rivière ou canal.\n "+
					"Il est par aileurs facilement portable. Conçu pour des déplacements plus long, il est équipé d'une cabine pour\n" +
					" deyx personnes, et peut recevoir un aménagement cuisine sommaire\n\n" +
					"La partie arrière est équipé de deux banquettes bois et d'une plate-forme\n\n" +
					
			"Caractéristiques :\n" +
			"• longueur : 5.5, m\n" +
			"• poids : 500 KG,\n" +
			"• équipement : cabine aménagée pour 2 personnes et pouvant recevoir un appareillage\n" +
			"  sommage de cuisine, arrière aménagée en solarium," +
			"• adjonction d'un moteur hors-bord ou d'un mat.";
	
	_descriptionC = "Dernier-né de la gamme, le bateau classe \"C\" est destiné presque exclusiment aux promenade en mer ou\n" +
					"en lac. Il permet également la peche au gros/ Difficilement transportable, sauf par des spécialistes,\n" +
					"ce bateau sera également de manière paermanente à un port\n" +
					"Plus grand et plus luxueux, compte tenu de la clienèle à laquelle il est destiné, ce bateau de plaisance\n" +
					"comprend :\n" +
					"\n" +
				"Caractéristiques :\n" +
				"• longueur : 8 m,\n" +
				"• poids : 1300 KG,\n" +
				"• équipement : 2 cabines,\n" +
				"• peut recevoir deux moteurs puissant pour la haute mer.\n";

	
	_prixA = 3000;
	_prixB = 7500;
	_prixC = 18000;
	}
	}

}
