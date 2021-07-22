package;

import lime.app.Application;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import openfl.Lib;
import flixel.addons.transition.TransitionData;
import flixel.addons.transition.Transition;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import MainVariables._variables;
import Discord.DiscordClient;
import ui.FlxVirtualPad;

using StringTools;

class FirstTimeState extends MusicBeatState
{
	var nextMsg:Bool = false;
	var sinMod:Float = 0;
	var txt:FlxText;

	var _pad:FlxVirtualPad;

	public static var leftState:Bool = false;

	override function create()
	{
		var lol = (cast(Lib.current.getChildAt(0), Main)).lastY;
		FlxTween.tween(Application.current.window, {y: lol}, 0.5, {ease: FlxEase.circOut});
		
		DiscordClient.changePresence("Started for the first time.", null);

		txt = new FlxText(0, 360, FlxG.width,
			"WARNING:\nFNF: Mic'd Up may potentially trigger seizures for people with photosensitive epilepsy. Viewer discretion is advised.\n\n"
			+ "FNF: Mic'd Up is a non-profit modification, aimed for entertainment purposes, and wasn't meant to be an attack on Ninjamuffin99"
			+ " and/or any other modmakers out there. I was not aiming for replacing what Friday Night Funkin' was, is and will."
			+ " It was made for fun and from the love for the game itself. All of the comparisons between this and other mods are purely coincidental, unless stated otherwise.\n\n"
			+ "Now with that out of the way, I hope you'll enjoy this FNF mod.\nFunk all the way.\nPress ENTER to proceed",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		add(txt);
// crap
		_pad = new FlxVirtualPad(NONE, A);
		_pad.alpha = 0.65;
		this.add(_pad);

		super.create();
	}

	override function update(elapsed:Float)
	{
		var no:Bool = false;
		sinMod += 0.007;
		txt.y = Math.sin(sinMod)*60+100;
//crap 3
		/*var UP_P:Bool = false;
		var DOWN_P:Bool = false;
		var LEFT_P:Bool = false;
		var RIGHT_P:Bool = false;*/
		var ACCEPT:Bool = false;
		/*var BACK:Bool = false;
		UP_P = _pad.buttonUp.justPressed;
		DOWN_P = _pad.buttonDown.justPressed;
		LEFT_P = _pad.buttonLeft.justPressed;
		RIGHT_P = _pad.buttonRight.justPressed;*/
		ACCEPT = _pad.buttonA.justPressed;
		//BACK = _pad.buttonB.justPressed;

		if (controls.ACCEPT || ACCEPT)
		{
			_variables.firstTime = false;
			leftState = true;
			MainVariables.Save();
			
			FlxG.switchState(new BugDisclaimerState());
		}

		// if (FlxG.keys.justPressed.ENTER && nextMsg)
		// {
		// 	_variables.firstTime = false;
		// 	MainVariables.Save();
		// 	AutoOffsetState.ass = true;
		// 	FlxG.switchState(new AutoOffsetState());
		// }

		// if (FlxG.keys.justPressed.ESCAPE && nextMsg)
		// {
		// 	_variables.firstTime = false;
		// 	MainVariables.Save();
		// 	FlxG.switchState(new TitleState());
		// }

		super.update(elapsed);
	}
}
