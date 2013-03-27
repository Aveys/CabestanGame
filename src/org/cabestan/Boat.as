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
			addAnimation("rameD",[0,1,2,3,4],7,false);
			addAnimation("rameG",[4,3,2,1,0],7,false);
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
			if(velocity.x<0)
				play("rameD");
			else
				play("rameG");
		}
	}
}
