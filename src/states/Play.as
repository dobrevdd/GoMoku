package states
{
	import core.Assets;
	import core.Game;
	
	import flash.events.MouseEvent;
	
	import interfaces.IState;
	
	import managers.PlayerManager;
	import managers.RowManager;
	
	import objects.Row;
	import objects.player;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Play extends Sprite implements IState
	{
		private var game:Game;
		public var rowManager: RowManager;
		public var playerManager: PlayerManager;
		private var player1: player;
		private var player2: player;
		private var background:Image;
		
		public function Play(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE, init);
			addEventListener(TouchEvent.TOUCH, onClick);
		}
		
		private function init(event:Event):void
		{
			background = new Image(Assets.backgroundTexture);
			addChild(background);
			
			rowManager = new RowManager(this); // create the board here
			
			// create players
			player1 = new player("Dido");
			player2 = new player("Tusik");
			
			// generating who will be first on random basic
			var f: Number;
			f = Math.random()*10;
			if(f < 5)
			{
				player1.first = true;
				player1.xo = 1;
				player2.xo = 0;
			}
			else
			{
				player2.first = true;
				player2.xo = 1;
				player1.xo = 0;
			}
			
			// create player manager
			playerManager = new PlayerManager(player1, player2, this);
			if(player2.first) {
				playerManager.makeTurnComputer(true);
			}
			
		}
		
		private function onClick(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.getTouches(this);
			var clicked:DisplayObject = e.currentTarget as DisplayObject;
			if ( touches.length == 1 )
			{
				var touch:Touch = touches[0];   
				if ( touch.phase == TouchPhase.ENDED )
				{
					var s: Row;
					//trace(e.currentTarget, e.target);
					var w: Image;
					w = e.target as Image;
					s = w.parent as Row;
					
					trace(w.parent);
					
					if(!playerManager.isGameOver()) {
						playerManager.makeTurnHuman(s);
						//w.x = w.x -4;	
					}
					if(!playerManager.isGameOver()) {
						playerManager.makeTurnComputer();
					}
					
				}
			}
		}
		
		private function onSquare(event:TouchEvent):void
		{
			trace("click works...");
			
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}