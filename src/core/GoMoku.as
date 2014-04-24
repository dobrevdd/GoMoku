package core
{
import flash.display.Sprite;

import starling.core.Starling;

[SWF(width=800, height=600, frameRate=60, backgroundColor=0x000000)]

public class GoMoku extends Sprite
{
    public function GoMoku()
    {
        var moku:Starling = new Starling(Game, stage);
        moku.showStats = true;
        moku.start();
    }
}
}
