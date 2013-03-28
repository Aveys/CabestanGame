package org.cabestan
{
	import flash.text.FontStyle;
	
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class BoatState extends FlxState
	{
		[Embed(source="../assets/image_Barque1.jpg")] private var Logo:Class;
		private var _logo:FlxSprite;
		private var _desciption:FlxText;
		private var _Prix:FlxText;
		
		private var _descriptionA:String;
		private var _descriptionB:String;
		private var _descriptionC:String;
		
		private var _prixA:Number;
		private var _prixB:Number;
		private var _prixC:Number;
		
		override public function create():void
		{
			initText();
			FlxG.mouse.show();
			_logo = new FlxSprite(0,0);
			_logo.loadGraphic(Logo);
			add(_logo);	
			
			_desciption = new FlxText(0,240,340,_descriptionA);
			_Prix = new FlxText(FlxG.width/2,240,340,"Prix : 3000 €");
			_Prix.alignment = "center";
			_Prix.size = 20;
			add(_Prix);
			add(_desciption);
			
			super.create();
		}
		
		
	public function initText():void
	{
		_descriptionA = "C'est le modèle le plus simple. Très dépouillé, la barque est destiné en principe à la peche.\n\n" +
						"L'aménagement est sommaire et comprend uniquement trois banquettes en bois.\n\n" +
						"Il est en en général vendu comme bateau de peche pour le pecheur non professionnel mais assidu.\n" +
						" Sa fonction est en fait peu determinée. Il est en effet, souvent utilisé comme bateau de peche,\n" +
						"mais également comme bateau promenade, voire, dans certains cas, comme moyen de locomotion dans les\n " +
						"bocages, en raison de son très faible tirant d'eau.\n" +
						"\n" +
						"Caractéristiques :\n" +
						"• longueur : 4 m\n" +
						"• poids : 250 KG\n" +
						"• équipement : 3 banquettes en bois\n" +
						"• possibilité moteur de faible puissance\n" +
						"• système de traction : rame, godille ou moteur\n";
		
		
	_descriptionB = "Plus spécialisé, le bateau classe \"B\" est destiné à la promenade en mer, lac, estuaire de rivière ou canal.\n "+
					"Il est par aileurs facilement portable. Conçu pour des déplacements plus long, il est équipé d'une cabine pour\n" +
					" deyx personnes, et peut recevoir un aménagement cuisine sommaire\n\n" +
					"La partie arrière est équipé de deux banquettes bois et d'une plate-forme\n\n"
					
			"Caractéristiques :\n" +
			"• longueur : 5.5 m\n" +
			"• poids : 500 KG\n" +
			"• équipement : cabine aménagée pour 2 personnes et pouvant recevoir un appareillage\n" +
			"  sommage de cuisine, arrière aménagée en solarium" +
			"• adjonction d'un moteur hors-bord ou d'un mat";
	
	_descriptionA = "C'est le modèle le plus simple. Très dépouillé, la barque est destiné en principe à la peche.\n\n" +
			"L'aménagement est sommaire et comprend uniquement trois banquettes en bois.\n\n" +
			"Il est en en général vendu comme bateau de peche pour le pecheur non professionnel mais assidu.\n" +
			" Sa fonction est en fait peu determinée. Il est en effet, souvent utilisé comme bateau de peche,\n" +
			"mais également comme bateau promenade, voire, dans certains cas, comme moyen de locomotion dans les\n " +
			"bocages, en raison de son très faible tirant d'eau.\n" +
			"\n" +
			"Caractéristiques :\n" +
			"• longueur : 5.5 m\n" +
			"• poids : 500 KG\n" +
			"• équipement : 3 banquettes en bois\n" +
			"• possibilité moteur de faible puissance\n" +
			"• système de traction : rame, godille ou moteur\n";
	
	_prixA = 3000;
	_prixB = 7500;
	_prixC = 18000;
	}
	}
}