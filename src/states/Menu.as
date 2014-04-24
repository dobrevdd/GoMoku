package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Menu extends Sprite implements IState
	{
		private var game:Game;
		private var play:Button;
		private var background:Image;
		
		public function Menu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			background = new Image(Assets.backgroundTexture);
			addChild(background);
			
			play = new Button(Assets.playButtonTexture);
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.pivotX = play.width * 0.5;
			play.x = 400;
			play.y = 200;
			addChild(play);
		}
		
		private function onPlay(event:Event):void
		{
			game.changeState(Game.PLAY_STATE);	
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			background.removeFromParent(true);
			background = null;
			
			play.removeFromParent(true);
			play = null;
			
			removeFromParent(true);
		}
	}
}