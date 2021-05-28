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
import flixel.util.FlxGradient;
import flixel.addons.display.FlxBackdrop;

using StringTools;

class AboutState extends MusicBeatState
{
	var logoBl:FlxSprite;

	var bg:FlxSprite = new FlxSprite(-89).loadGraphic(Paths.image('pBG_Main'));
	var checker:FlxBackdrop = new FlxBackdrop(Paths.image('Play_Checker'), 0.2, 0.2, true, true);
	var gradientBar:FlxSprite = new FlxSprite(0,0).makeGraphic(FlxG.width, 300, 0xFFAA00AA);
	//var side:FlxSprite = new FlxSprite(0).loadGraphic(Paths.image('Play_Bottom'));

	var text:FlxText;

	override function create()
	{

		// LOAD MUSIC

		// LOAD CHARACTERS

		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.03;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = true;
		bg.y -= bg.height;
		add(bg);

		gradientBar = FlxGradient.createGradientFlxSprite(Math.round(FlxG.width), 512, [0x00ff0000, 0x55FFC461, 0xAAFBFF89], 1, 90, true); 
		gradientBar.y = FlxG.height - gradientBar.height;
		add(gradientBar);
		gradientBar.scrollFactor.set(0, 0);

		add(checker);
		checker.scrollFactor.set(0, 0.07);

		/*side.scrollFactor.x = 0;
		side.scrollFactor.y = 0.1;
		side.antialiasing = true;
		side.screenCenter();
		add(side);
		side.y = FlxG.height - side.height/3*2;*/

		logoBl = new FlxSprite(-150, -100);
		logoBl.frames = Paths.getSparrowAtlas('logoBumpin');
		logoBl.antialiasing = true;
		logoBl.animation.addByPrefix('bump', 'logo bumpin', 24);
		logoBl.animation.play('bump');
		logoBl.updateHitbox();
		logoBl.screenCenter();
		logoBl.y = logoBl.y - 100;

		text = new FlxText(0, 0, 0, "Version 1.2" + "\n" + "PORTED BY" + "\n" + "Luckydog7" + "zacksgamerz" + "\n" + "klaviergayming" + "\n" + "peppy" + "\n", 64);
		text.setFormat(Paths.font("vcr.ttf"), 32, FlxColor.WHITE, RIGHT);
		text.screenCenter();
		text.y = text.y + 150;

		add(bg);
		add(logoBl);
		add(text);

 
		super.create();
	}


	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.sound.music.volume < 0.7)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		#if android
		if (FlxG.android.justReleased.BACK)
		{
			FlxG.switchState(new OptionsMenu());
		}
		#end

	}

}