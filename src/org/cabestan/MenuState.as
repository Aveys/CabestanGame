package org.cabestan
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import org.flixel.*;
	
	public class MenuState extends FlxState
	{
		public var logo:FlxSprite;
		[Embed(source="../assets/logo.png")] private var Logo:Class;
		public var bg:FlxSprite;
		[Embed(source="../assets/bg.png")] private var Bg:Class;
		override public function create():void
		{
			bg = new FlxSprite();
			bg.loadGraphic(Bg);
			add(bg);
			FlxG.score = 3000;
			FlxG.IsBoughtA = false;
			FlxG.IsBoughtB = false;
			FlxG.IsBoughtC = false;
			
			FlxG.mouse.show();
			FlxG.bgColor=0xFF33CCFF;
			var new_timer:Timer = new Timer(50, 20);
			new_timer.start();
			// function timer_complete will be called once the timer expires, 2 secs in this case
			new_timer.addEventListener(TimerEvent.TIMER_COMPLETE, timer_complete);
			new_timer.addEventListener(TimerEvent.TIMER ,timer_tick);
			logo = new FlxSprite(20,20);
			logo.loadGraphic(Logo);
			add(logo);
			
			var instructions:FlxButton;
			instructions = new FlxButton(FlxG.width/2-40,FlxG.height/3+54, "Accèder au jeu",stGame);
			add(instructions);
			
		} // end function create
		
		
		override public function update():void
		{
			super.update(); // calls update on everything you added to the game loop
			
		} // end function update
		public function stGame():void{
			FlxG.switchState(new BoutiqueState());
		}
		public function timer_complete(event:TimerEvent):void {
			logo.alpha=0;
		}
		public function timer_tick(event:TimerEvent):void{
			logo.alpha-=0.1;
		}
		
		public function MenuState()
		{
			super();
			
		}  // end function MenuState
		
	} // end class
}// end package 
