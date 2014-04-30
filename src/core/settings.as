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

        /*
        Логика версия 1.1
        1 - make 1                  19 - make 3
        2 - block op.1 : 1 block,   20 - b3:1
        3 - b1:2                    21 - b3:2
        4 - b1:3                    22 - b3:3
        5 - b1:4                    23 - b3:4
        6 - b1:5                    24 - b3:5
        7 - b1:6                    25 - b3:6
        8 - b1:7                    26 - b3:7
        9 - b1:8                    27 - b3:8

        10 - make 2                 28 - make 4
        11 - make 2, b1:1
        12 - make 2, b1:2
        13 - make 2, b1:3
        14 - make 2, b1:4
        15 - make 2, b1:5
        16 - make 2, b1:6
        17 - make 2, b1:7
        18 - make 2, b1:8

        11 - b2:1                   29 - b4:1
        12 - b2:2                   30 - b4:2
        13 - b2:3                   31 - b4:3
        14 - b2:4                   32 - b4:4
        15 - b2:5                   33 - b4:5
        16 - b2:6                   34 - b4:6
        17 - b2:7                   35 - b4:7
        18 - b2:8                   36 - b4:8
                                    37 - make 5

         */

        public static const MAKE_1:int = 1;
		public static const BLOCK_OPPONENT_1:int = 2;
        public static const MAKE_2:int = 10;
        public static const MAKE_2_BLOCK_1 = 11;
        public static const BLOCK_OPPONENT_2:int = 19;
        public static const MAKE_3:int = 27;
        public static const MAKE_3_BLOCK_1:int = 28;
        public static const MAKE_3_BLOCK_2:int = 36;
        public static const BLOCK_OPPONENT_3:int = 44;
        public static const MAKE_4:int = 52;
        public static const MAKE_4_BLOCK_1:int = 53;
        public static const MAKE_4_BLOCK_2:int = 61;
        public static const MAKE_4_BLOCK_3:int = 69;
		public static const BLOCK_OPPONENT_4:int = 77;
		public static const MAKE_5:int = 85;
	}
}