package ui;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;

import ui.FlxVirtualPad;
import ui.Hitbox;
import ui.PausePad;

import Config;

class Mobilecontrols extends FlxSpriteGroup
{
	public var mode:ControlsGroup = HITBOX;

	public var _hitbox:Hitbox;
	public var _virtualPad:FlxVirtualPad;
	public var _pausing:PausePad;

	var config:Config;

	public function new() 
	{
		super();
		
		config = new Config();

		// load control mode num from Config.hx
		mode = getModeFromNumber(config.getcontrolmode());
		trace(config.getcontrolmode());

		switch (mode)
		{
			case VIRTUALPAD_RIGHT:
				initVirtualPad(0);
				//add(_pausing);
			case VIRTUALPAD_LEFT:
				initVirtualPad(1);
				//add(_pausing);
			case VIRTUALPAD_CUSTOM:
				initVirtualPad(2);
				//add(_pausing);
			case HITBOX:
				_hitbox = new Hitbox();
				add(_hitbox);
				add(_pausing);
			case KEYBOARD:
			    add(_pausing);
		}
	}

	function initVirtualPad(vpadMode:Int) 
	{
		switch (vpadMode)
		{
			case 1:
				_virtualPad = new FlxVirtualPad(FULL, NONE);
				_pausing = new PausePad(NONE, P)
			case 2:
				_virtualPad = new FlxVirtualPad(FULL, NONE);
				_virtualPad = config.loadcustom(_virtualPad);
				_pausing = new PausePad(NONE, P)
			default: // 0
				_virtualPad = new FlxVirtualPad(RIGHT_FULL, NONE);
				_pausing = new PausePad(NONE, P)
		}
		_pausing.alpha = 0.75;
		_virtualPad.alpha = 0.75;
		add(_virtualPad);
		add(_pausing);	
	}


	public static function getModeFromNumber(modeNum:Int):ControlsGroup {
		return switch (modeNum)
		{
			case 0: VIRTUALPAD_RIGHT;
			case 1: VIRTUALPAD_LEFT;
			case 2: KEYBOARD;
			case 3: VIRTUALPAD_CUSTOM;
			case 4:	HITBOX;

			default: VIRTUALPAD_RIGHT;

		}
	}
}

enum ControlsGroup {
	VIRTUALPAD_RIGHT;
	VIRTUALPAD_LEFT;
	KEYBOARD;
	VIRTUALPAD_CUSTOM;
	HITBOX;
}