package;

import flixel.FlxG;
import flixel.util.FlxSave;
import flixel.math.FlxPoint;

// just a test
class FilesystemEmu {
    
    var save:FlxSave;

    public function new()
    {
        save = new FlxSave();
    	save.bind("saveconrtol");
    }
    
    public function loadCurrent():String
    {
        if (save.data.config == null)
		{ 
            save.data.config = new String('');
        }

        return save.data.config;
    }

    public function saveCurrent(json:String)
    {
        if (save.data.config == null)
		{ 
            save.data.config = new String('');
        }

        save.data.config = json;

        save.flush();
    }

    public function saveContent(key:String, json:String)
    {
        if (save.data.config == null)
		{ 
            save.data.config = new Array();
        }

        save.data.config[Std.parseInt(key)] = json;

        save.flush();
    }

    public function getContent(key:String, json:String)
    {
        if (save.data.config == null)
		{ 
            save.data.config = new Array();
        }

        return save.data.config[Std.parseInt(key)];
    }
}