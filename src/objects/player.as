package objects
{
	public class player
	{
		private var name: String;
		private var _first: Boolean;
		private var _xo: int;  // 1 - means X, 0 - means O 
		
		public function player(name:String)
		{
			this.name = name;
			this.first = false;
		}

		public function get xo():int
		{
			return _xo;
		}

		public function set xo(value:int):void
		{
			_xo = value;
		}

		public function get first():Boolean
		{
			return _first;
		}

		public function set first(value:Boolean):void
		{
			_first = value;
		}
		
		public function getName():String
		{
			return name;
		}

	}
}