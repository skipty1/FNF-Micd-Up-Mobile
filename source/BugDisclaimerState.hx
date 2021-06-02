package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import MainVariables._variables;
import ui.FlxVirtualPad;

using StringTools;

#if desktop
import Discord.DiscordClient;
#end

class BugDisclaimerState extends MusicBeatState
{
    var _pad:FlxVirtualPad;
	var sinMod:Float = 0;
	var txt:FlxText = new FlxText(0, 360, FlxG.width,
		"You are now in version '1.4' of the port\n"
		+ "The bugs in this version are as the following:\n"
		+ "AGOTI's background\nIdk what else\n\n"
		+ "If you found any extra bugs, be sure to go to our github by pressing B\n"
		+ "Now with that out of the way, I hope you'll enjoy this FNF mod.\nFunk all the way.\nPress ENTER or A to proceed",
		32);

	override function create()
	{

		#if desktop
				DiscordClient.changePresence("Started for the first time.", null);
		#end
		
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		add(txt);
// crap
		_pad = new FlxVirtualPad(NONE, A_B);
		_pad.alpha = 0.65;
		this.add(_pad);

		super.create();
	}

	override function update(elapsed:Float)
	{
		sinMod += 0.007;
		txt.y = Math.sin(sinMod)*60+100;
//crap 3
		/*var UP_P:Bool = false;
		var DOWN_P:Bool = false;
		var LEFT_P:Bool = false;
		var RIGHT_P:Bool = false;*/
		var ACCEPT:Bool = false;
		var BACK:Bool = false;
		/*var BACK:Bool = false;
		UP_P = _pad.buttonUp.justPressed;
		DOWN_P = _pad.buttonDown.justPressed;
		LEFT_P = _pad.buttonLeft.justPressed;
		RIGHT_P = _pad.buttonRight.justPressed;*/
		ACCEPT = _pad.buttonA.justPressed;
		BACK = _pad.buttonB.justPressed;

		if (controls.ACCEPT || ACCEPT)
		{
			FlxG.switchState(new TitleState());
		}
		if (controls.BACK || BACK)
		{
		    FlxG.openURL('https://github.com/KlavierGayming/FNF-Micd-Up-Mobile');
		    FlxG.switchState(new TitleState());
		}
		super.update(elapsed);
	}
}
