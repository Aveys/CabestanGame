package org.cabestan
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class Boat extends FlxSprite
	{
		public var lvlBateau:Number=0;
		private var start:FlxPoint;
		
		[Embed(source="../assets/barque.png")] private var Barque:Class;
		
		public function Boat(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			start= new FlxPoint(X,Y);
			loadGraphic(Barque,true,false,16,16,true);
			width=16;
			height=16;
			addAnimation("rame",[0,1,2,3,4],7,true);
			if (FlxG.getPlugin(FlxControl) == null)
			{
				FlxG.addPlugin(new FlxControl);
			}
			FlxControl.create(this, FlxControlHandler.MOVEMENT_ACCELERATES, FlxControlHandler.STOPPING_DECELERATES, 1, true, false);
			
			FlxControl.player1.setCursorControl(true, true, true, true);
			
			FlxControl.player1.setMovementSpeed(400, 0, 100, 200, 400, 0);
			
			FlxControl.player1.setGravity(0,0);
			
			facing = FlxObject.RIGHT;
		}
		
		override public function update():void
		{
			super.update();
			
			if (x < 0)
			{
				x = 0;
			}
			play("rame");
		}
	}
}
