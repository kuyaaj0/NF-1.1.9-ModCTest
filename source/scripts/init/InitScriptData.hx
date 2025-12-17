package scripts.init;

import crowplexus.iris.Iris;

import scripts.lua.*;

//hxcodec
import vlc.MP4Handler; //2.5.0-2.5.1
import VideoHandler; //2.6.0-2.6.1
import hxcodec.flixel.FlxVideo; //3.0.0-3.0.1

class InitScriptData {
    public static function init() {
        
        //psychlua
        Iris.proxyImports.set("psychlua.CallbackHandler", CallbackHandler);
        Iris.proxyImports.set("psychlua.CustomSubstate", CustomSubstate);
        Iris.proxyImports.set("psychlua.DebugLuaText", DebugLuaText);
        Iris.proxyImports.set("psychlua.DeprecatedFunctions", DeprecatedFunctions);
        Iris.proxyImports.set("psychlua.ExtraFunctions", ExtraFunctions);
        Iris.proxyImports.set("psychlua.FlxAnimateFunctions", FlxAnimateFunctions);
        Iris.proxyImports.set("psychlua.FunkinLua", FunkinLua);
        Iris.proxyImports.set("psychlua.LuaUtils", LuaUtils);
        Iris.proxyImports.set("psychlua.ModchartAnimateSprite", ModchartAnimateSprite);
        Iris.proxyImports.set("psychlua.ModchartSprite", ModchartSprite);
        Iris.proxyImports.set("psychlua.ReflectionFunctions", ReflectionFunctions);
        Iris.proxyImports.set("psychlua.ShaderFunctions", ShaderFunctions);
        Iris.proxyImports.set("psychlua.TextFunctions", TextFunctions);


        //hxcodec
        Iris.proxyImports.set("vlc.MP4Handler", MP4Handler);
        Iris.proxyImports.set("VideoHandler", VideoHandler);
        Iris.proxyImports.set("hxcodec.VideoHandler", VideoHandler);
        Iris.proxyImports.set("hxcodec.flixel.FlxVideo", FlxVideo);


        //-------------------- PSYCH v0.7.3 --------------------\\
        //debug
        Iris.proxyImports.set("FPSCounter", developer.display.FPSCounter);


        //states
        Iris.proxyImports.set("AchievementsMenuState", states.AchievementsMenuState);
        Iris.proxyImports.set("CreditsState", states.CreditsState);
        Iris.proxyImports.set("FlashingState", states.FlashingState);
        //Iris.proxyImports.set("FreeplayState", states.FreeplayState);
        Iris.proxyImports.set("FreeplayState", states.FreeplayStatePsych);  //兼容Psych界面)
        Iris.proxyImports.set("LoadingState", states.LoadingState);
        Iris.proxyImports.set("MainMenuState", states.MainMenuState);
        Iris.proxyImports.set("ModsMenuState", states.ModsMenuState);
        Iris.proxyImports.set("OutdatedState", states.OutdatedState);
        Iris.proxyImports.set("PlayState", states.PlayState);
        Iris.proxyImports.set("ScaleSimulationState", states.ScaleSimulationState);
        Iris.proxyImports.set("StoryMenuState", states.StoryMenuState);
        Iris.proxyImports.set("TitleState", states.TitleState);

        //states.editors
        Iris.proxyImports.set("CharacterEditorState", states.editors.CharacterEditorState);
        Iris.proxyImports.set("ChartingState", states.editors.ChartingState);
        ////Iris.proxyImports.set("ConfirmationPopupSubstate", states.editors.ConfirmationPopupSubstate);
        Iris.proxyImports.set("DialogueCharacterEditorState", states.editors.DialogueCharacterEditorState);
        Iris.proxyImports.set("DialogueEditorState", states.editors.DialogueEditorState);
        Iris.proxyImports.set("EditorPlayState", states.editors.EditorPlayState);
        Iris.proxyImports.set("MasterEditorMenu", states.editors.MasterEditorMenu);
        Iris.proxyImports.set("MenuCharacterEditorState", states.editors.MenuCharacterEditorState);
        Iris.proxyImports.set("NoteSplashDebugState", states.editors.NoteSplashDebugState);
        ////Iris.proxyImports.set("NoteSplashEditorState", states.editors.NoteSplashEditorState);   //似乎是Psych 1.0+的东西，取消注释会导致打包出错
        ////Iris.proxyImports.set("StageEditorState", states.editors.StageEditorState);
        Iris.proxyImports.set("WeekEditorState", states.editors.WeekEditorState);


        //stages            //呃呃我不知道这个应不应该加上————牢喵233
        Iris.proxyImports.set("Limo", stages.Limo);
        Iris.proxyImports.set("Mall", stages.Mall);
        Iris.proxyImports.set("MallEvil", stages.MallEvil);
        Iris.proxyImports.set("Philly", stages.Philly);
        Iris.proxyImports.set("School", stages.School);
        Iris.proxyImports.set("SchoolEvil", stages.SchoolEvil);
        Iris.proxyImports.set("Spooky", stages.Spooky);
        Iris.proxyImports.set("StageWeek1", stages.StageWeek1);
        Iris.proxyImports.set("Tank", stages.Tank);
        Iris.proxyImports.set("Template", stages.Template);
        //stages.objects
        Iris.proxyImports.set("BackgroundDancer", stages.objects.BackgroundDancer);
        Iris.proxyImports.set("BackgroundGirls", stages.objects.BackgroundGirls);
        Iris.proxyImports.set("BackgroundTank", stages.objects.BackgroundTank);
        Iris.proxyImports.set("DadBattleFog", stages.objects.DadBattleFog);
        Iris.proxyImports.set("MallCrowd", stages.objects.MallCrowd);
        Iris.proxyImports.set("PhillyGlowGradient", stages.objects.PhillyGlowGradient);
        Iris.proxyImports.set("PhillyGlowParticle", stages.objects.PhillyGlowParticle);
        Iris.proxyImports.set("PhillyTrain", stages.objects.PhillyTrain);
        Iris.proxyImports.set("TankmenBG", stages.objects.TankmenBG);


        //substates
        //Iris.proxyImports.set("CreditsSubState", substates.CreditsSubState);
        //Iris.proxyImports.set("ErrorSubState", substates.ErrorSubState);
        Iris.proxyImports.set("GameOverSubstate", substates.GameOverSubstate);
        Iris.proxyImports.set("GameplayChangersSubstate", substates.GameplayChangersSubstate);
        Iris.proxyImports.set("PauseSubState", substates.PauseSubState);
        Iris.proxyImports.set("Prompt", substates.Prompt);
        //Iris.proxyImports.set("CreditsSubState", substates.PsychCreditsSubState);
        //Iris.proxyImports.set("RelaxSubState", substates.RelaxSubState);
        Iris.proxyImports.set("ResetScoreSubState", substates.ResetScoreSubState);


        //options
        Iris.proxyImports.set("BaseOptionsMenu", options.base.BaseOptionsMenu);
        Iris.proxyImports.set("ControlsSubState", options.base.ControlsSubState);
        Iris.proxyImports.set("ModSettingsSubState", options.base.ModSettingsSubState);
        Iris.proxyImports.set("NoteOffsetState", options.base.NoteOffsetState);
        Iris.proxyImports.set("NotesSubState", options.base.NotesSubState);


        //objects
        Iris.proxyImports.set("AchievementPopup", objects.AchievementPopup);
        Iris.proxyImports.set("Alphabet", objects.Alphabet);
        Iris.proxyImports.set("AttachedSprite", objects.AttachedSprite);
        Iris.proxyImports.set("AttachedText", objects.AttachedText);
        Iris.proxyImports.set("Bar", objects.Bar);
        Iris.proxyImports.set("BGSprite", objects.BGSprite);
        Iris.proxyImports.set("Character", objects.Character);
        Iris.proxyImports.set("CheckboxThingie", objects.CheckboxThingie);
        Iris.proxyImports.set("HealthIcon", objects.HealthIcon);
        Iris.proxyImports.set("MenuCharacter", objects.MenuCharacter);
        Iris.proxyImports.set("MenuItem", objects.MenuItem);
        Iris.proxyImports.set("MusicPlayer", objects.MusicPlayer);
        Iris.proxyImports.set("Note", objects.Note);
        Iris.proxyImports.set("NoteSplash", objects.NoteSplash);
        Iris.proxyImports.set("StrumNote", objects.StrumNote);
        Iris.proxyImports.set("TypedAlphabet", objects.TypedAlphabet);


        //cutscenes
        Iris.proxyImports.set("CutsceneHandler", cutscenes.CutsceneHandler);
        Iris.proxyImports.set("DialogueBox", cutscenes.DialogueBox);
        Iris.proxyImports.set("DialogueBoxPsych", cutscenes.DialogueBoxPsych);
        Iris.proxyImports.set("DialogueCharacter", cutscenes.DialogueCharacter);


        //backend
        Iris.proxyImports.set("PsychAnimationController", backend.animation.PsychAnimationController);  //animation
        Iris.proxyImports.set("Achievements", backend.Achievements);
        Iris.proxyImports.set("BaseStage", backend.BaseStage);
        Iris.proxyImports.set("ClientPrefs", backend.ClientPrefs);
        Iris.proxyImports.set("Conductor", backend.Conductor);
        Iris.proxyImports.set("Controls", backend.Controls);
        Iris.proxyImports.set("CoolUtil", backend.CoolUtil);
        Iris.proxyImports.set("CustomFadeTransition", backend.CoolUtil);
        Iris.proxyImports.set("Difficulty", backend.Difficulty);
        //Iris.proxyImports.set("Discord", backend.Discord);    //Psych 073有这个，但编译出错)
        Iris.proxyImports.set("Highscore", backend.Highscore);
        Iris.proxyImports.set("InputFormatter", backend.InputFormatter);
        Iris.proxyImports.set("Mods", backend.Mods);
        Iris.proxyImports.set("MusicBeatState", backend.MusicBeatState);
        Iris.proxyImports.set("MusicBeatSubstate", backend.MusicBeatSubstate);
        Iris.proxyImports.set("NoteTypesConfig", backend.NoteTypesConfig);
        Iris.proxyImports.set("Paths", backend.Paths);
        Iris.proxyImports.set("PsychCamera", backend.PsychCamera);
        Iris.proxyImports.set("Rating", backend.Rating);
        Iris.proxyImports.set("Section", backend.Section);
        Iris.proxyImports.set("Song", backend.Song);
        Iris.proxyImports.set("StageData", backend.StageData);
        Iris.proxyImports.set("WeekData", backend.WeekData);
        

        //shaders
        Iris.proxyImports.set("BlendModeEffect", shaders.BlendModeEffect);
        Iris.proxyImports.set("ColorSwap", shaders.ColorSwap);
        Iris.proxyImports.set("OverlayShader", shaders.OverlayShader);
        Iris.proxyImports.set("RGBPalette", shaders.RGBPalette);
        Iris.proxyImports.set("WiggleEffect", shaders.WiggleEffect);

        //-------------------- PSYCH v0.6.3 --------------------\\
        
    }
}