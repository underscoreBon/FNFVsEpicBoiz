package;

import GameJolt;
import flixel.ui.FlxButton;
#if desktop
import Discord.DiscordClient;
#end
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import lime.app.Application;
import Achievements;
import editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import GameJolt.GameJoltAPI;

using StringTools;

//This Menu Crashed Many Times, Making it Freeplay Menu-Based

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.2'; //This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var grpCats:FlxTypedGroup<Alphabet>;

	private var camGame:FlxCamera;
	private var camAchievement:FlxCamera;
	
	var optionShit:Array<String> = [
		'story mode',
		'freeplay',
        'awards',
		'credits',
		'options',
		'gamejolt'
	];
    //MusicBeatState.switchState(new GameJoltLogin());

	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var bg:FlxSprite;

	override function create()
	{
		WeekData.loadTheFirstEnabledMod();

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end

		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		camGame = new FlxCamera();
		camAchievement = new FlxCamera();
		camAchievement.bgColor.alpha = 0;

		//FlxG.cameras.reset(camGame);
		//FlxG.cameras.add(camAchievement);
		//FlxCamera.defaultCameras = [camGame];

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		bg = new FlxSprite(-80).loadGraphic(Paths.image('menuBG'));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		
		// magenta.scrollFactor.set();

		//menuItems = new FlxTypedGroup<FlxSprite>();
		//add(menuItems);

		//var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		/*for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * 140)  + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = Paths.getSparrowAtlas('mainmenu/menu_' + optionShit[i]);
			menuItem.animation.addByPrefix('idle', optionShit[i] + " basic", 24);
			menuItem.animation.addByPrefix('selected', optionShit[i] + " white", 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			//menuItem.screenCenter(X);
			menuItem.x = 80;
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if(optionShit.length < 6) scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			//menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}*/

		//FlxG.camera.follow(camFollowPos, null, 1);

		// NG.core.calls.event.logEvent('swag').send();

		grpCats = new FlxTypedGroup<Alphabet>();
		add(grpCats);

        for (i in 0...optionShit.length)
        {
			var sText:Alphabet = new Alphabet(0, (70 * i) + 30, optionShit[i], true, false);
            sText.targetY = i;
            sText.isMenuItem = true;
			grpCats.add(sText);
			//catsText
		}
        changeSelection();

		var versionShit:FlxText = new FlxText(12, FlxG.height - 44, 0, "Psych Engine V." + psychEngineVersion, 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		var versionShit:FlxText = new FlxText(12, FlxG.height - 24, 0, "Friday Night Funkin: VsEpicBoiz V." + Application.current.meta.get('version'), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);

		if (GameJoltAPI.getStatus()){
		var versionShit:FlxText = new FlxText(900, 12, 0, "GameJolt - Signed In as: " + GameJoltAPI.getUserInfo(true), 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(versionShit);
		if (!Achievements.isAchievementUnlocked('logged')){
			Achievements.unlockAchievement('logged');
			GameJoltAPI.getTrophy(174564);
		} //Gives GameJolt Achivement
		}
	}


	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));



		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeSelection(-1);
			}

			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeSelection(1);
			}


			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				var daChoice:String = optionShit[curSelected];
				selectedSomethin = true;
				switch(daChoice)
				{
					case 'story mode':
						MusicBeatState.switchState(new StoryMenuState());
					case 'freeplay':
						MusicBeatState.switchState(new FreeplaySelectState());
					case 'options':
						LoadingState.loadAndSwitchState(new options.OptionsState());
					case 'awards':
						MusicBeatState.switchState(new AchievementsMenuState());
					case 'credits':
						MusicBeatState.switchState(new CreditsState());
					case 'gamejolt':
						MusicBeatState.switchState(new GameJoltLogin());
				}
			}
			#if desktop
			if (FlxG.keys.anyJustPressed(debugKeys))
			{
				if (GameJoltAPI.getUserInfo(true) == "n_bonnie2"){
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu()); // cheat all ya want, if you have my GJ account
				}
			}
			#end
		}
/*
			if (controls.ACCEPT)
			{
				if (optionShit[curSelected] == 'donate')
				{
					CoolUtil.browserLoad('https://ninja-muffin24.itch.io/funkin');
				}
				else
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					if(ClientPrefs.flashing) FlxFlicker.flicker(magenta, 1.1, 0.15, false);

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'story_mode':
										MusicBeatState.switchState(new StoryMenuState());
									case 'freeplay':
										MusicBeatState.switchState(new FreeplaySelectState());
									#if MODS_ALLOWED
									case 'mods':
										MusicBeatState.switchState(new ModsMenuState());
									#end
									case 'awards':
										MusicBeatState.switchState(new AchievementsMenuState());
									case 'credits':
										MusicBeatState.switchState(new CreditsState());
									case 'options':
										LoadingState.loadAndSwitchState(new options.OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			#end
		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			//spr.screenCenter(X);
		});
	}
*/
    super.update(elapsed);
}

/*
		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if(menuItems.length > 4) {
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}

}*/
function changeSelection(change:Int = 0) {
	curSelected += change;

	if (curSelected < 0)
		curSelected = optionShit.length - 1;
	if (curSelected >= optionShit.length)
		curSelected = 0;

	var bullShit:Int = 0;

	for (item in grpCats.members) {
		item.targetY = bullShit - curSelected;
		bullShit++;

		item.alpha = 0.6;
		if (item.targetY == 0) {
			item.alpha = 1;
		}
	}
	FlxG.sound.play(Paths.sound('scrollMenu'));
}
}