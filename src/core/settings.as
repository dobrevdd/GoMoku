package core
{
	public class settings
	{
		public static const HORIZONTAL_LINE_DIRECTION:int = 1;
		public static const VERTICAL_LINE_DIRECTION:int = 2;
		public static const DIAGONAL_LEFT_RIGHT_LINE_DIRECTION:int = 3;
		public static const DIAGONAL_RIGHT_LEFT_LINE_DIRECTION:int = 4;
		
		/*
		Логика версия 1
		
		9 - прави 5 поредни (печели)
		8 - блокира 4 поредни на опонента
        7 - прави четири поредни
		6 - блокира 3 поредни на опонента
        5 - прави 3 поредни
		4 - блокира 2 поредни на опонента
        3 - прави 2 поредни
		2 - блокира 1 поредна на опонента
        1 - прави 1 поредно
		*/
		//constants for the logic

        public static const MAKE_1:int = 1;
		public static const BLOCK_OPPONENT_1:int = 2;
        public static const MAKE_2:int = 3;
        public static const BLOCK_OPPONENT_2:int = 4;
        public static const MAKE_3:int = 5;
        public static const BLOCK_OPPONENT_3:int = 6;
        public static const MAKE_4:int = 7;
		public static const BLOCK_OPPONENT_4:int = 8;
		public static const MAKE_5:int = 9;
	}
}