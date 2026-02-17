package games.funkin.backend;

import flixel.input.keyboard.FlxKey;
import flixel.FlxBasic;
import haxe.Json;
#if sys
import sys.io.File;
import sys.FileSystem;
#end

typedef FrameSave = {
	var time:Float;
	var pressKey:Array<FlxKey>;
	var releaseKey:Array<FlxKey>;
}

typedef StateRecord = {
	var songName:String;
	var songLength:Float;
	var playDate:String;
	
	var songSpeed:Float;
	var playbackRate:Float;
	var healthGain:Float;
	var healthLoss:Float;
	var cpuControlled:Bool;
	var practiceMode:Bool;
	var instakillOnMiss:Bool;
	var playOpponent:Bool; 
	var flipChart:Bool;
	
	var songScore:Int; 
	var ratingPercent:Float;
	var ratingFC:String;
	var songHits:Int;
	var highestCombo:Int;
	var songMisses:Int;
	var hitMapTime:Array<Float>;
	var hitMapMs:Array<Float>;
}

class Replay extends FlxBasic
{
	public var frameData:Array<FrameSave> = [];

	/////////////////////////////////////////////

	public function new()
	{
		super();
	}

	private var lastSaveTime:Float = 0;
	override function update(elapsed:Float)
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ANY || FlxG.keys.justReleased.ANY || lastSaveTime >= 0.01666) {
			lastSaveTime = 0;
			frameData.push(inputUpload());
		} else {
			lastSaveTime += elapsed;
		}
	}

	private var pressKey:Array<FlxKey> = [];
	private var releaseKey:Array<FlxKey> = [];
	private function inputUpload():FrameSave
	{
		pressKey = releaseKey = [];
		for (keyName in FlxKey.fromStringMap.keys()) 
		{
			var key:FlxKey = FlxKey.fromStringMap.get(keyName);
			
			if (key == FlxKey.ANY || key == FlxKey.NONE || key == FlxKey.ENTER) continue;

			if (FlxG.keys.checkStatus(key, JUST_PRESSED)) {
				pressKey.push(keyName);
			}
			if (FlxG.keys.checkStatus(key, JUST_RELEASED)) {
				releaseKey.push(keyName);
			}
		}
		return {
			time: Conductor.songPosition,
			pressKey: pressKey,
			releaseKey: releaseKey
		};
	}

	public function savePlayRecord(data:StateRecord)
	{
		#if sys
		var json = {
			stateRecord: data,
			frameRecord: frameData
		};

		var content:String = Json.stringify(json, null, "\t");

		var folder:String = "replays/";
		if (!FileSystem.exists(folder))
			FileSystem.createDirectory(folder);

		var fileName:String = "replay-" + data.songName + "-" + Date.now().getTime() + ".rsd";
		
		fileName = StringTools.replace(fileName, " ", "-");
		fileName = StringTools.replace(fileName, ":", "");
		fileName = StringTools.replace(fileName, "/", "");
		fileName = StringTools.replace(fileName, "\\", "");
		
		var path:String = folder + fileName;
		File.saveContent(path, content);
		#end
	}
}

class ReplayData {
}
