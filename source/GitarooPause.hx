package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import ui.FlxVirtualPad;

class GitarooPause extends MusicBeatState
{
	var replayButton:FlxSprite;
	var cancelButton:FlxSprite;
	var _pad:FlxVirtualPad;

	var replaySelect:Bool = false;

	public function new():Void
	{
		super();
	}

	override function create()
	{
		if (FlxG.sound.music != null)
			FlxG.sound.music.stop();

		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('pauseAlt/pauseBG'));
		add(bg);

		var bf:FlxSprite = new FlxSprite(0, 30);
		bf.frames = Paths.getSparrowAtlas('pauseAlt/bfLol');
		bf.animation.addByPrefix('lol', "funnyThing", 13);
		bf.animation.play('lol');
		add(bf);
		bf.screenCenter(X);

		replayButton = new FlxSprite(FlxG.width * 0.28, FlxG.height * 0.7);
		replayButton.frames = Paths.getSparrowAtlas('pauseAlt/pauseUI');
		replayButton.animation.addByPrefix('selected', 'bluereplay', 0, false);
		replayButton.animation.appendByPrefix('selected', 'yellowreplay');
		replayButton.animation.play('selected');
		add(replayButton);

		cancelButton = new FlxSprite(FlxG.width * 0.58, replayButton.y);
		cancelButton.frames = Paths.getSparrowAtlas('pauseAlt/pauseUI');
		cancelButton.animation.addByPrefix('selected', 'bluecancel', 0, false);
		cancelButton.animation.appendByPrefix('selected', 'cancelyellow');
		cancelButton.animation.play('selected');
		add(cancelButton);

		changeThing();
// crap
		_pad = new FlxVirtualPad(LEFT_RIGHT, A);
		_pad.alpha = 0.65;
		this.add(_pad);

		super.create();
	}

	override function update(elapsed:Float)
	{
	    //crap 3
		/*var UP_P:Bool = false;
		var DOWN_P:Bool = false;*/
		var LEFT_P:Bool = false;
		var RIGHT_P:Bool = false;
		var ACCEPT:Bool = false;
		/*var BACK:Bool = false;
		UP_P = _pad.buttonUp.justPressed;
		DOWN_P = _pad.buttonDown.justPressed;*/
		LEFT_P = _pad.buttonLeft.justPressed;
		RIGHT_P = _pad.buttonRight.justPressed;
		ACCEPT = _pad.buttonA.justPressed;
		//BACK = _pad.buttonB.justPressed;
		if (controls.LEFT_P || controls.RIGHT_P || LEFT_P || RIGHT_P)
			changeThing();

		if (controls.ACCEPT || ACCEPT)
		{
			if (replaySelect)
			{
				FlxG.switchState(new PlayState());
			}
			else
			{
				FlxG.switchState(new MainMenuState());
			}
		}

		super.update(elapsed);
	}

	function changeThing():Void
	{
		replaySelect = !replaySelect;

		if (replaySelect)
		{
			cancelButton.animation.curAnim.curFrame = 0;
			replayButton.animation.curAnim.curFrame = 1;
		}
		else
		{
			cancelButton.animation.curAnim.curFrame = 1;
			replayButton.animation.curAnim.curFrame = 0;
		}
	}
}
