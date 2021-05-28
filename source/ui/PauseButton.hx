package ui;

import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.graphics.frames.FlxTileFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;
import flixel.graphics.frames.FlxAtlasFrames;
import flash.display.BitmapData;
import flixel.graphics.FlxGraphic;
import openfl.utils.ByteArray;

class PauseButton extends FlxButton
{
    public function new(X:Float = 0, Y:Float = 0)
    {
        super(X, Y);

        var vframe = getVirtualInputFrames().getByName("c");
        
        frames = FlxTileFrames.fromFrame(vframe, FlxPoint.get(44 * 3, 45 * 3));
        
        resetSizeFromFrame();
        solid = false;
        immovable = true;
        scrollFactor.set();

        #if FLX_DEBUG
		ignoreDrawDebug = true;
		#end
    }

    public static function getVirtualInputFrames():FlxAtlasFrames
	{
			/*#if !web
			var bitmapData = new GraphicVirtualInput2(0, 0);
			var graphic:FlxGraphic = FlxGraphic.fromBitmapData(bitmapData);
			return FlxAtlasFrames.fromSpriteSheetPacker(graphic, Std.string(new VirtualInputData2()));
			#else*/
			var graphic:FlxGraphic = FlxGraphic.fromAssetKey(Paths.image('pause'));
			return FlxAtlasFrames.fromSpriteSheetPacker(graphic, Std.string(new ui.FlxVirtualPad.VirtualInputData()));
			//#end
	}
}