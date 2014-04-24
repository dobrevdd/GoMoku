package states
{
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	
	public class GameOver extends Sprite implements IState
	{
		private var game:Game;
		
		public function GameOver(game:Game)
		{
			this.game = game;
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}