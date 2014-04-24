package core
{
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="../../assets/playButton.png")]
		private static var playButton:Class;
		public static var playButtonTexture:Texture;
		
		[Embed(source="../../assets/background.png")]
		private static var background:Class;
		public static var backgroundTexture:Texture;
		
		[Embed(source="../../assets/square.png")]
		private static var square:Class;
		public static var squareTexture:Texture;
		
		[Embed(source="../../assets/circle.png")]
		private static var circle:Class;
		public static var circleTexture:Texture;
		
		[Embed(source="../../assets/cross.png")]
		private static var cross:Class;
		public static var crossTexture:Texture;
		
		[Embed(source="../../assets/winlineHorizontal.png")]
		private static var winlineHorizontal:Class;
		public static var winlineHorizontalTexture:Texture;
		
		[Embed(source="../../assets/winlineVertical.png")]
		private static var winlineVertical:Class;
		public static var winlineVerticalTexture:Texture;
		
		[Embed(source="../../assets/winlineLeftRightDiagonal.png")]
		private static var winlineLeftRightDiagonal:Class;
		public static var winlineLeftRightDiagonalTexture:Texture;
		
		[Embed(source="../../assets/winlineRightLeftDiagonal.png")]
		private static var winlineRightLeftDiagonal:Class;
		public static var winlineRightLeftDiagonalTexture:Texture;
		
		[Embed(source="../../assets/gameOver.png")]
		private static var gameOverText:Class;
		public static var gameOverTextTexture:Texture;
		
		public static function init():void
		{
			playButtonTexture = Texture.fromBitmap(new playButton());
			backgroundTexture = Texture.fromBitmap(new background());
			squareTexture = Texture.fromBitmap(new square());
			circleTexture = Texture.fromBitmap(new circle());
			crossTexture = Texture.fromBitmap(new cross());
			winlineHorizontalTexture = Texture.fromBitmap(new winlineHorizontal());
			winlineVerticalTexture = Texture.fromBitmap(new winlineVertical());
			winlineLeftRightDiagonalTexture = Texture.fromBitmap(new winlineLeftRightDiagonal());
			winlineRightLeftDiagonalTexture = Texture.fromBitmap(new winlineRightLeftDiagonal());
			gameOverTextTexture = Texture.fromBitmap(new gameOverText());
		}
	}
}