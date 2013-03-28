package org.cabestan
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Boat extends FlxSprite
	{
		public var lvlBateau:Number=0;
		private var start:FlxPoint;
		
		[Embed(source="../assets/barque.png")] private var Barque:Class;
		[Embed(source="../assets/bateaub.png")] private var bateauB:Class;
		[Embed(source="../assets/bateauc.png")] private var bateauC:Class;
		private var Bateau:Class;
		
		public function Boat(X:Number=0, Y:Number=0,typeBateau:Number=0)
		{
			
			
			super(X, Y);
			start= new FlxPoint(X,Y);
			if(typeBateau == 1)
				Bateau = Barque;
			else if(typeBateau == 2)
				Bateau = bateauB;
			else if(typeBateau == 3)
				Bateau = bateauC;
			
			loadGraphic(Bateau,true,false,40,40,true);
			width=40;
			height=40;
			addAnimation("rame",[0,1,2,3,4],7,false);

			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			FlxControl.create(this, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			FlxControl.player1.setCursorControl(true, true, true, true);
			
			FlxControl.player1.setMovementSpeed(200,200,200,200);

			FlxControl.player1.setBounds(16,16,600,440);
			
			facing = FlxObject.RIGHT;
		}
		
		override public function update():void
		{
			super.update();
				play("rame");

		}
	}
}
