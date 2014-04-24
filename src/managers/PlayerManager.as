package managers
{
	import core.Assets;
	
	import objects.Row;
	import objects.player;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	
	import states.Play;

	public class PlayerManager
	{
		private var player1: player;
		private var player2: player;
		private var currentPlayerTurn: player;
		private var play: Play;
		private var gameOverSign:DisplayObject;
		private var gameOver:Boolean = false;
		
		public function PlayerManager(player1:player,player2:player, play: Play)
		{
			this.play = play;
			this.player1 = player1;
			this.player2 = player2;
			
			if(this.player1.first)
				currentPlayerTurn = this.player1;
			else
				currentPlayerTurn = this.player2;
		}
		
		public function makeTurnHuman(row:Row):void
		{
			if(!row.isFilled())
			{
				row.clicked(currentPlayerTurn.xo); //filling the row
				
				//now we need to check if player wins
				if(hasPlayerWon(row.getRowGridPos(),row.getColumnGridPos())) 
				{
				 gameOverSign = new Image(Assets.gameOverTextTexture);
				 gameOverSign.x = 600;
				 gameOverSign.y = 100;
				 play.addChild(gameOverSign);
				 gameOver = true;
				}
				else
				{
					if(currentPlayerTurn == player1)
						currentPlayerTurn = player2;
					else
						currentPlayerTurn = player1;	
				}
				
					
			}
			else
			{
				trace("the row is filled");
			}
		}
		
		public function makeTurnComputer(first_move:Boolean=false):void
		{
			var randRow:int;
			var randCol:int;
			var row: Row;

            if(first_move)
            {
                randRow = Math.random() * 19;
                randCol = Math.random() * 19;
                row = play.rowManager.getRow(randRow, randCol);
            }
            else
            {
                row = play.rowManager.getRowAI();
            }

			row.clicked(currentPlayerTurn.xo); //filling the row
			
			//now we need to check if player wins
			if(hasPlayerWon(row.getRowGridPos(),row.getColumnGridPos())) 
			{
				gameOverSign = new Image(Assets.gameOverTextTexture);
				gameOverSign.x = 600;
				gameOverSign.y = 100;
				play.addChild(gameOverSign);
				gameOver = true;
			}
			else
			{
				if(currentPlayerTurn == player1)
					currentPlayerTurn = player2;
				else
					currentPlayerTurn = player1;	
			}
			
			
		}
		
		// Function that checkes if the player wins
		private function hasPlayerWon(rowGridPos:int, columnGridPos:int):Boolean
		{
			if(play.rowManager.checkHorizontalWin(rowGridPos, columnGridPos) || 
				play.rowManager.checkVerticalWin(rowGridPos, columnGridPos) || 
				play.rowManager.checkLeftRightDiagonalWin(rowGridPos, columnGridPos) || 
				play.rowManager.checkRightLeftDiagonalWin(rowGridPos, columnGridPos))
			{
				return true;	
			}
			return false;
		}
		
		public function isGameOver():Boolean
		{
			return gameOver;	
		}
		
		public function getCurrentPlayer():player
		{
			return currentPlayerTurn;
		}
	}
}