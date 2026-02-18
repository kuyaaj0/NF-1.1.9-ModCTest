package useless.editors;

import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;

class ChartingState extends MusicBeatState
{
    public static var GRID_SIZE:Int = 40;


    var DadGridBG:FlxSprite;
    var DadColumns:Int = 6;

    var BFGridBG:FlxSprite;
    var BFColumns:Int = 6;

    var GFGridBG:FlxSprite;
    var GFColumns:Int = 6;

    var AllGrid:FlxTypedGroup<FlxSprite>;

    var songLength:Float = 3000;
    var bpm:Float = 120;
    
    override function create()
	{
		Paths.clearStoredMemory();
		Paths.clearUnusedMemory();

		#if DISCORD_ALLOWED
		DiscordClient.changePresence("Charting State", null);
		#end

		var menuBG:FlxSprite = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		menuBG.antialiasing = ClientPrefs.data.antialiasing;
		menuBG.setGraphicSize(Std.int(menuBG.width * 1.1));
		menuBG.updateHitbox();
		menuBG.screenCenter();
		menuBG.scrollFactor.set();
		add(menuBG);

        AllGrid = new FlxTypedGroup<FlxSprite>();
		add(AllGrid);

        DadGridBG = FlxGridOverlay.create(1, 1, DadColumns, 20);
        DadGridBG.x = 80;
        DadGridBG.y = 180;
		DadGridBG.antialiasing = false;
		DadGridBG.scale.set(GRID_SIZE, GRID_SIZE);
		DadGridBG.updateHitbox();

        AllGrid.add(DadGridBG);

        BFGridBG = FlxGridOverlay.create(1, 1, BFColumns, 20);
        BFGridBG.x = DadGridBG.width + DadGridBG.x + 80;
        BFGridBG.y = 180;
		BFGridBG.antialiasing = false;
		BFGridBG.scale.set(GRID_SIZE, GRID_SIZE);
		BFGridBG.updateHitbox();

        AllGrid.add(BFGridBG);

        GFGridBG = FlxGridOverlay.create(1, 1, BFColumns, 20);
        GFGridBG.x = BFGridBG.width + BFGridBG.x + 80;
        GFGridBG.y = 180;
		GFGridBG.antialiasing = false;
		GFGridBG.scale.set(GRID_SIZE, GRID_SIZE);
		GFGridBG.updateHitbox();

        AllGrid.add(GFGridBG);

        super.create();
    }

    function createGridBG(ID:Int, defColumns:Int = 4)
    {
        ID = Std.int(Math.min(ID, AllGrid.length));

        var newGridBG =  FlxGridOverlay.create(1, 1, defColumns, 20);
        newGridBG.x = BFGridBG.width + BFGridBG.x + 80;
        newGridBG.y = 180;
		newGridBG.antialiasing = false;
		newGridBG.scale.set(GRID_SIZE, GRID_SIZE);
		newGridBG.updateHitbox();

        AllGrid.add(newGridBG);
    }
}