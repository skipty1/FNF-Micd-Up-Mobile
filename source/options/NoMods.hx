package options;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

using StringTools;

class NoMods extends MusicBeatState
{ //copypasted from AboutState
	var logoBl:FlxSprite;

	var text:FlxText;

	override function create()
	{

		// LOAD MUSIC

		// LOAD CHARACTERS

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('funkin'));
		
		/*logoBl = new FlxSprite(-150, -100);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
		logoBl.animation.play('bump');
		logoBl.updateHitbox();
		logoBl.screenCenter();
		logoBl.y = logoBl.y - 100;*/

		text = new FlxText(0, 0, 0, "UH OH! IT LOOKS LIKE YOU HAVE\n" + "NO MODS INSTALLED.\n\n" + "press A to download the mods-menu patch\n" + "or press B to go back!\n" + "", 64);
		text.setFormat(Paths.font("Funkin.otf"), 32, FlxColor.WHITE, RIGHT);
		text.screenCenter();
		text.y = text.y + 150;

		// unavailable is unavailable
        if (false)
        {
		add(bg);
		//add(logoBl);
		add(text);
        }
        else
        {
            FlxG.switchState(new mods.ModsMenuWeek());
        }//just a test if it doesnt work. just lock the code -Zack

//crap but better
        #if mobileC
        addVirtualPad(NONE, A_B);
        #end

		super.create();
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

        if (controls.ACCEPT)
        {
            FlxG.openURL('https://github.com/KlavierGayming/FNF-Micd-Up-Mobile/tree/mods-menu');
        }
        if (controls.BACK)
        {
            FlxG.switchState(new PlaySelection());
        }

		/*#if android
		if (FlxG.android.justReleased.BACK)
		{
			FlxG.switchState(new OptionsMenu());
		}
		#end*/

	}

}