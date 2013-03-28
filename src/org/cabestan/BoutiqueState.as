package org.cabestan
{
	import org.flixel.*;
	
	public class BoutiqueState extends FlxState
	{
		[Embed(source="../assets/logo.png")] private var Logo:Class;
		private var _logo:FlxSprite;
		private var _MenuText: FlxText;
		
		override public function create():void
		{
			FlxG.bgColor = 0xFFFFFFFF;
			_logo = new FlxSprite(90,10);
			_logo.loadGraphic(Logo);
			add(_logo);
			
			_MenuText = new FlxText(0,400, FlxG.width, "Boutique de Cabestan");					
			_MenuText.setFormat(null, 16, 0xFF000000, "center");
			add(_MenuText);
			
			super.create();
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}