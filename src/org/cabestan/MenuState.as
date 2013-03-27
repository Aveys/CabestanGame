package org.cabestan
{
	import org.flixel.*;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	public class MenuState extends FlxState
	{
		public var logo:FlxSprite;
		[Embed(source="../assets/logo.png")] private var Logo:Class;
		override public function create():void
		{
			var new_timer:Timer = new Timer(500, 2);
			// function timer_complete will be called once the timer expires, 2 secs in this case
			new_timer.addEventListener(TimerEvent.TIMER_COMPLETE, timer_complete);
			logo.loadGraphic(Logo);
			add(logo);
			
			var title:FlxText;
			title = new FlxText(0, 16, FlxG.width, "Game Title");
			title.setFormat (null, 16, 0xFFFFFFFF, "center");
			add(title);
			
			var instructions:FlxText;
			instructions = new FlxText(0, FlxG.height - 32, FlxG.width, "Press Space To Play");
			instructions.setFormat (null, 8, 0xFFFFFFFF, "center");
			add(instructions);
			
		} // end function create
		
		
		override public function update():void
		{
			super.update(); // calls update on everything you added to the game loop
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new PlayState());
			}
			
		} // end function update
		public function timer_complete(event:TimerEvent):void {
			
		}
		
		public function MenuState()
		{
			super();
			
		}  // end function MenuState
		
	} // end class
}// end package 
