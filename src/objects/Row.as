package objects
{
	import core.Assets;
	import core.settings;
	
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Row extends Sprite
	{
		private var backgr:Image;
		private var fill:Image;
		private var filled:Boolean = false;
		private var xo:int = 3;
		private var rowGridPos:int;
		private var columnGridPos: int;
		private var winline:Image;
		
		
		public function Row(rowGridPos:int, columnGridPos:int)
		{
			this.rowGridPos = rowGridPos;
			this.columnGridPos = columnGridPos;
			backgr = new Image(Assets.squareTexture);
			addChild(backgr);
			
		}
		
		public function clicked(xo:int):void
		{
			if(xo == 1)
			{
				fill = new Image(Assets.crossTexture);
				fill.x = 2;
				fill.y = 2;
				addChild(fill);
				filled = true;
				this.xo = xo;
			} 
			else
			{
				fill = new Image(Assets.circleTexture);
				fill.x = 2;
				fill.y = 2;
				addChild(fill);
				filled = true;
				this.xo = xo;
			}
		}
		
		/**
		 * 
		 * @param direction
		 * 1 - horizontal
		 * 2 - vertical
		 * 
		 */
		public function drawWinLine(direction:int):void
		{
			switch (direction) { 
				case settings.HORIZONTAL_LINE_DIRECTION:
					winline = new Image(Assets.winlineHorizontalTexture);
					winline.y = 13;
					addChild(winline);
					break;
				case settings.VERTICAL_LINE_DIRECTION:
					winline = new Image(Assets.winlineVerticalTexture);
					winline.x = 13;
					addChild(winline);
					break;
				case settings.DIAGONAL_LEFT_RIGHT_LINE_DIRECTION:
					winline = new Image(Assets.winlineLeftRightDiagonalTexture)
					addChild(winline);
					break;
				case settings.DIAGONAL_RIGHT_LEFT_LINE_DIRECTION:
					winline = new Image(Assets.winlineRightLeftDiagonalTexture)
					addChild(winline);
					break;
			}
			
		}
		
		public function isFilled():Boolean
		{
			return filled;
		}
		
		public function getRowGridPos():int
		{
			return rowGridPos;
		}
		
		public function getColumnGridPos():int
		{
			return columnGridPos;
		}
		
		public function getXO():int
		{
			return xo;
		}
		
		public function destroy():void
		{
			
		}
	}
	
}