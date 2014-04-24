package managers
{
	import core.settings;
	
	import objects.Row;
	
	import states.Play;

	public class RowManager
	{
		private var play:Play;
		private var grid:Vector.<Vector.<Row>>; 
		
		public function RowManager(play:Play)
		{
			this.play = play;
			grid = new Vector.<Vector.<Row>>(19);
			var x: int = 35;
			var y: int = 29;
			for(var i:int=0; i<19; i++)
			{
				x = 35;
				grid[i] = new Vector.<Row>(19);
				for(var j:int=0; j<19; j++)
				{
					var w : Row;
					w = new Row(i,j);
					w.x= x;
					w.y= y;
					play.addChild(w);
					grid[i][j] = w;
					x +=29;
				}
				y +=29;
			}
		}
		
		public function isRowFilled(row:int, column:int):Boolean
		{
			return grid[row][column].isFilled();
		}
		
		public function getRow(row:int, column:int):Row
		{
			return grid[row][column];
		}
		
		public function checkHorizontalWin(rowGridPos:int, columnGridPos:int):Boolean
		{
			var startPos:int;
			var endPos:int;
			var xo:int = grid[rowGridPos][columnGridPos].getXO();
			
			//determining the start and end positiions
			startPos = columnGridPos - 4;
			if(startPos < 0)
				startPos = 0;
			endPos = columnGridPos + 4;
			if(endPos > 18)
				endPos = 18;
			
			var counter:int = 0;
			var winRows: Vector.<Row> = new Vector.<Row>(5);
			for(var i:int=startPos; i<=endPos; i++)
			{
				if(grid[rowGridPos][i].getXO() == xo)
				{
					counter++;
					winRows[counter-1] = grid[rowGridPos][i];
					if(counter==5) break;
				}
					
				else
					counter = 0;
			}
			
			if(counter == 5)
			{
				for(i = 0; i<5; i++)
				{
					winRows[i].drawWinLine(settings.HORIZONTAL_LINE_DIRECTION);	
				}
				return true;	
			}
			
			return false;
		}
		
		public function checkVerticalWin(rowGridPos:int, columnGridPos:int):Boolean
		{
			var startPos:int;
			var endPos:int;
			var xo:int = grid[rowGridPos][columnGridPos].getXO();
			
			//determining the start and end positiions
			startPos = rowGridPos - 4;
			if(startPos < 0)
				startPos = 0;
			endPos = rowGridPos + 4;
			if(endPos > 18)
				endPos = 18;
			
			var counter:int = 0;
			var winRows: Vector.<Row> = new Vector.<Row>(5);
			for(var i:int=startPos; i<=endPos; i++)
			{
				if(grid[i][columnGridPos].getXO() == xo)
				{
					counter++;
					winRows[counter-1] = grid[i][columnGridPos];
					if(counter==5) break;
				}
					
				else
					counter = 0;
			}
			
			if(counter == 5)
			{
				for(i = 0; i<5; i++)
				{
					winRows[i].drawWinLine(settings.VERTICAL_LINE_DIRECTION);	
				}
				return true;	
			}
			
			return false;
		}
		
		public function checkLeftRightDiagonalWin(rowGridPos:int, columnGridPos:int):Boolean
		{
			var rowStartPos:int;
			var rowEndPos:int;
			var columnStartPos:int;
			var columnEndPos: int;
			var xo:int = grid[rowGridPos][columnGridPos].getXO();
			
			//determining the start and end positiions of the row
			rowStartPos = rowGridPos - 4;
			if(rowStartPos < 0)
				rowStartPos = 0;
			rowEndPos = rowGridPos + 4;
			if(rowEndPos > 18)
				rowEndPos = 18;
			
			//determining the start and the end positions of the column
			columnStartPos = columnGridPos - 4;
			if(columnStartPos < 0)
				columnStartPos = 0;
			columnEndPos = columnGridPos + 4;
			if(columnEndPos > 18)
				columnEndPos = 18;
			
			var counter:int = 0;
			var winRows: Vector.<Row> = new Vector.<Row>(5);
			for(var i:int=rowStartPos, j:int=columnStartPos; i<=rowEndPos && j<=columnEndPos; i++, j++)
			{
				if(grid[i][j].getXO() == xo)
				{
					counter++;
					winRows[counter-1] = grid[i][j];
					if(counter==5) break;
				}
					
				else
					counter = 0;
			}
			
			if(counter == 5)
			{
				for(i = 0; i<5; i++)
				{
					winRows[i].drawWinLine(settings.DIAGONAL_LEFT_RIGHT_LINE_DIRECTION);	
				}
				return true;	
			}
			
			return false;
		}
		
		public function checkRightLeftDiagonalWin(rowGridPos:int, columnGridPos:int):Boolean
		{
			var rowStartPos:int;
			var rowEndPos:int;
			var columnStartPos:int;
			var columnEndPos: int;
			var xo:int = grid[rowGridPos][columnGridPos].getXO();
			
			//determining the start and end positiions of the row
			rowStartPos = rowGridPos - 4;
			if(rowStartPos < 0)
				rowStartPos = 0;
			rowEndPos = rowGridPos + 4;
			if(rowEndPos > 18)
				rowEndPos = 18;
			
			//determining the start and the end positions of the column
			columnStartPos = columnGridPos + 4;
			if(columnStartPos > 18)
				columnStartPos = 18;
			columnEndPos = columnGridPos - 4;
			if(columnEndPos < 0)
				columnEndPos = 0;
			
			var counter:int = 0;
			var winRows: Vector.<Row> = new Vector.<Row>(5);
			for(var i:int=rowStartPos, j:int=columnStartPos; i<=rowEndPos && j>=columnEndPos; i++, j--)
			{
				if(grid[i][j].getXO() == xo)
				{
					counter++;
					winRows[counter-1] = grid[i][j];
					if(counter==5) break;
				}
					
				else
					counter = 0;
			}
			
			if(counter == 5)
			{
				for(i = 0; i<5; i++)
				{
					winRows[i].drawWinLine(settings.DIAGONAL_RIGHT_LEFT_LINE_DIRECTION);	
				}
				return true;	
			}
			
			return false;
		}
		
		
		//Връщаме резултат къде компютъра да ходи
		public function getRowAI():Row
		{
			var row:Row;
			var level:int = 0;
            var xo_cur_player:int;
            var xo_opponent:int;

            //
            xo_cur_player = play.playerManager.getCurrentPlayer().xo;
            if(xo_cur_player == 0) xo_opponent = 1;
            else
                xo_opponent = 0;
			
			for(var i:int = 0; i<=18; i++)
			{
				for(var j:int = 0; j<=18; j++)
				{
					if(!grid[i][j].isFilled()) 
					{
                        trace("Cheking.....",i,j);
						var lvlTmp:int = checkRowLevels(i,j,xo_cur_player,xo_opponent);
						if(lvlTmp>level)
						{
							level = lvlTmp;
							row = grid[i][j];	
						}
					}	
				}
			}
			
			return row;
		}
		
		// Проверяваме всички приоритети за дадена клетка и връща
		// най големия приоритет
		private function checkRowLevels(rowPos:int, colPos:int, xo_cur_player:int, xo_opponent:int):int
		{
			//var rowLevels:Array = new Array();
			var highestLevel: int = 1;
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.MAKE_1))
            {
                highestLevel = settings.MAKE_1;
            }
			if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.BLOCK_OPPONENT_1))
			{
				highestLevel = settings.BLOCK_OPPONENT_1;
			}
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.MAKE_2))
            {
                highestLevel = settings.MAKE_2;
            }
			if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.BLOCK_OPPONENT_2))
			{
				highestLevel = settings.BLOCK_OPPONENT_2;
			}
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.MAKE_3))
            {
                highestLevel = settings.MAKE_3;
            }
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.BLOCK_OPPONENT_3))
            {
                highestLevel = settings.BLOCK_OPPONENT_3;
            }
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.MAKE_4))
            {
                highestLevel = settings.MAKE_4;
            }
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.BLOCK_OPPONENT_4))
            {
                highestLevel = settings.BLOCK_OPPONENT_4;
            }
            if(checkRowLevel(rowPos, colPos, xo_cur_player, xo_opponent, settings.MAKE_5))
            {
                highestLevel = settings.MAKE_5;
            }
            //trace(checkBlockOpponent(rowPos,colPos,2,xo_opponent));
            //trace(checkMakeRows(rowPos,colPos,2,xo_cur_player));
			
			return highestLevel;
		}
		
		//Функцията проверява дали има клетката има определан левел
		private function checkRowLevel(rowPos:int, colPos:int, xo_cur_player:int, xo_opponent:int, level:int):Boolean
		{

			var applied:Boolean = false;
			
			switch(level) {

                case settings.MAKE_1:
                    //това винаги важи
                    applied = true;
                    break;

				case settings.BLOCK_OPPONENT_1:
					applied = checkBlockOpponent(rowPos,colPos,1,xo_opponent);
					break;

                case settings.MAKE_2:
                    applied = checkMakeRows(rowPos,colPos,2,xo_cur_player);
                    break;

				case settings.BLOCK_OPPONENT_2:
					applied = checkBlockOpponent(rowPos,colPos,2,xo_opponent);
					break;

                case settings.MAKE_3:
                    applied = checkMakeRows(rowPos,colPos,3,xo_cur_player);
                    break;

                case settings.BLOCK_OPPONENT_3:
                    applied = checkBlockOpponent(rowPos,colPos,3,xo_opponent);
                    break;

                case settings.MAKE_4:
                    applied = checkMakeRows(rowPos,colPos,4,xo_cur_player);
                    break;

                case settings.BLOCK_OPPONENT_4:
                    applied = checkBlockOpponent(rowPos,colPos,4,xo_opponent);
                    break;

                case settings.MAKE_5:
                    applied = checkMakeRows(rowPos,colPos,5,xo_cur_player);
                    break;
			}
			
			return applied;
		}
		
		// Checking if we are blocking a given amount of opponents squares
		private function checkBlockOpponent(rowPos:int,colPos:int,depth:int,xo_opponent:int):Boolean
		{
		    var isBlocking:Boolean = false;

            if(checkVertical(rowPos,colPos,depth,xo_opponent)) {
                trace("Block Vertical yes");
                isBlocking = true;
            }

            if(checkHorizontal(rowPos,colPos,depth,xo_opponent)) {
                trace("Block Horizontal yes");
                isBlocking = true;
            }

            if(checkDiagonalLR(rowPos,colPos,depth,xo_opponent)) {
                trace("Block Diagonal LR yes");
                isBlocking = true;
            }

            if(checkDiagonalRL(rowPos,colPos,depth,xo_opponent)) {
                trace("Block Diagonal RL yes");
                isBlocking = true;
            }
			
			return isBlocking;
		}

        //checking if we are making a given amount of squares
        private function checkMakeRows(rowPos:int,colPos:int,depth:int,xo_cur_player:int):Boolean
        {
            var isMaking:Boolean = false;

            if(checkVertical(rowPos,colPos,depth-1,xo_cur_player)) {
                trace("Making Vertical yes");
                isMaking = true;
            }

            if(checkHorizontal(rowPos,colPos,depth-1,xo_cur_player)) {
                trace("Making Horizontal yes");
                isMaking = true;
            }

            if(checkDiagonalLR(rowPos,colPos,depth-1,xo_cur_player)) {
                trace("Making Diagonal LR yes");
                isMaking = true;
            }

            if(checkDiagonalRL(rowPos,colPos,depth-1,xo_cur_player)) {
                trace("Making Diagonal RL yes");
                isMaking = true;
            }

            return isMaking;
        }

        //checking vertically if we are blocking given amount of squares of the opponent
        //checking vertically if we are making a given amount of squares
		private function checkVertical(rowPos:int,colPos:int, depth:int, xo:int):Boolean
        {
            //variables for start and end positions
            var rowStartPos:int;
            var rowEndPos:int;
            var isBlocking:Boolean = false;
            var foundRows:int = 0;

            //determining the start and end positions
            rowStartPos = rowPos - depth;
            if(rowStartPos < 0) rowStartPos = 0;
            rowEndPos = rowPos + depth;
            if(rowEndPos > 18) rowEndPos = 18;

            for(var i:int = rowStartPos; i <= rowEndPos; i++)
            {
                if(grid[i][colPos].getXO() == xo)
                {
                    foundRows++;
                }
                else
                {
                    foundRows = 0;
                }

                if(foundRows == depth)
                {
                    isBlocking = true;
                    break;
                }
            }

            return isBlocking;
        }

        //checking horizontally if we are blocking given amount of squares of the opponent
        //checking horizontally if we are making given amount of squares
        private function checkHorizontal(rowPos:int, colPos:int, depth:int, xo:int):Boolean
        {
            //variables for start and end positions
            var colStartPos:int;
            var colEndPos:int;
            var isBlocking:Boolean = false;
            var foundRows:int = 0;

            //determining the start and end positions
            colStartPos = colPos - depth;
            if(colStartPos < 0) colStartPos = 0;
            colEndPos = colPos + depth;
            if(colEndPos > 18) colEndPos = 18;

            for(var i:int = colStartPos; i <= colEndPos; i++)
            {
                if(grid[rowPos][i].getXO() == xo)
                {
                    foundRows++;
                }
                else
                {
                    foundRows = 0;
                }

                if(foundRows == depth)
                {
                    isBlocking = true;
                    break;
                }
            }

            return isBlocking;
        }

        //checking in diagonal Left To Right if we are blocking given amount of squares of the opponent
        //checking in diagonal Left To Right if we are making given amount of squares
        private function checkDiagonalLR(rowPos:int, colPos:int, depth:int, xo:int):Boolean
        {
            //variables for the start and end positions
            var colStartPos:int;
            var colEndPos:int;
            var rowStartPos:int;
            var rowEndPos:int;
            var isBlocking:Boolean = false;
            var foundRows:int = 0;

            //determining the start and end positions
            colStartPos = colPos - depth;
            rowStartPos = rowPos - depth;
            if(colStartPos < rowStartPos && colStartPos < 0)
            {
                rowStartPos = rowStartPos - colStartPos;
                colStartPos = 0;
            }

            if(rowStartPos < colStartPos && rowStartPos < 0)
            {
                colStartPos = colStartPos - rowStartPos;
                rowStartPos = 0;
            }

            if(colStartPos == rowStartPos && colStartPos < 0) {
                colStartPos = 0;
                rowStartPos = 0;
            }

            colEndPos = colPos + depth;
            rowEndPos = rowPos + depth;
            if(colEndPos > rowEndPos && colEndPos > 18)
            {
                rowEndPos = rowEndPos - (colEndPos - 18);
                colEndPos = 18;
            }

            if(rowEndPos > colEndPos && rowEndPos > 18)
            {
                colEndPos = colEndPos - (rowEndPos - 18);
                rowEndPos = 18;
            }

            if(rowEndPos == colEndPos && rowEndPos > 18)
            {
                rowEndPos = 18;
                colEndPos = 18;
            }

            for(var i:int=rowStartPos, j:int=colStartPos; i<=rowEndPos && j<=colEndPos; i++, j++)
            {
                if(grid[i][j].getXO() == xo)
                {
                    foundRows++;
                }
                else
                {
                    foundRows = 0;
                }

                if(foundRows == depth)
                {
                    isBlocking = true;
                    break;
                }
            }
            return isBlocking;
        }

        //checking in diagonal Right To Left if we are blocking given amount of squares of the opponent
        //checking in diagonal Right To Left if we are making given amount of squares
        private function checkDiagonalRL(rowPos:int, colPos:int, depth:int, xo:int):Boolean
        {
            //variables for the start and end positions
            var colStartPos:int;
            var colEndPos:int;
            var rowStartPos:int;
            var rowEndPos:int;
            var marginRow:int;
            var marginCol:int;
            var isBlocking:Boolean = false;
            var foundRows:int = 0;

            //determining the start and end positions
            colStartPos = colPos + depth;
            rowStartPos = rowPos - depth;
            if(colStartPos > 18 || rowStartPos < 0)
            {
                marginRow = 0 - rowStartPos;
                marginCol = colStartPos - 18;

                if(marginCol > marginRow)
                {
                    rowStartPos = (colStartPos - 18) + rowStartPos;
                    colStartPos = 18;
                }
                else if(marginCol == marginRow)
                {
                    rowStartPos = 0;
                    colStartPos = 18;
                }
                else if(marginRow > marginCol)
                {
                    colStartPos = colStartPos - marginRow;
                    rowStartPos = 0;
                }

            }

            colEndPos = colPos - depth;
            rowEndPos = rowPos + depth;
            if(rowEndPos > 18 || colEndPos < 0)
            {
                marginRow = rowEndPos - 18;
                marginCol = 0 - colEndPos;

                if(marginRow > marginCol)
                {
                    colEndPos = colEndPos + marginRow;
                    rowEndPos = 18;
                }
                else if(marginRow == marginCol)
                {
                    rowEndPos = 18;
                    colEndPos = 0;
                }
                else if(marginCol > marginRow)
                {
                    rowEndPos = rowEndPos - marginCol;
                    colEndPos = 0;
                }
            }

            for(var i:int=rowStartPos, j:int=colStartPos; i<=rowEndPos && j>=colEndPos; i++, j--)
            {
                if(grid[i][j].getXO() == xo)
                {
                    foundRows++;
                }
                else
                {
                    foundRows = 0;
                }

                if(foundRows == depth)
                {
                    isBlocking = true;
                    break;
                }
            }
            return isBlocking;
        }
		
	}
}