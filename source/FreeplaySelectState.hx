package;
#if desktop
import Discord.DiscordClient;
#end
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxSprite;
import flixel.FlxG;

class FreeplaySelectState extends MusicBeatState{
    var freeplayCats:Array<String> = ['Story Songs', 'Bonus Covers', 'Old Songs'];
	var grpCats:FlxTypedGroup<Alphabet>;
	var curSelected:Int = 0;
	var BG:FlxSprite;
	public static var FreeplayType:Int = 0;
    override function create(){
		#if desktop
		DiscordClient.changePresence("In Freeplay Select Menu", null);
		#end
        BG = new FlxSprite().loadGraphic(Paths.image('menuBGBlue'));
		BG.updateHitbox();
		BG.screenCenter();
		add(BG);
        grpCats = new FlxTypedGroup<Alphabet>();
		add(grpCats);
        for (i in 0...freeplayCats.length)
        {
			var catsText:Alphabet = new Alphabet(0, (70 * i) + 30, freeplayCats[i], true, false);
            catsText.targetY = i;
            catsText.isMenuItem = true;
			grpCats.add(catsText);
		}
        changeSelection();
        super.create();
    }

    override public function update(elapsed:Float){
        
		if (controls.UI_UP_P) 
			changeSelection(-1);
		if (controls.UI_DOWN_P) 
			changeSelection(1);
		if (controls.BACK) {
			FlxG.sound.play(Paths.sound('cancelMenu'));
			MusicBeatState.switchState(new MainMenuState());
		}
        if (controls.ACCEPT){
            switch(curSelected){
                case 0:
				FreeplayType = 0;
                MusicBeatState.switchState(new FreeplayState());
                case 1:
				FreeplayType = 1;
                MusicBeatState.switchState(new BonusFreeplay());
				case 2:
				FreeplayType = 2;
				MusicBeatState.switchState(new BonusFreeplay());
            }
        }
        super.update(elapsed);
    }

    function changeSelection(change:Int = 0) {
		curSelected += change;
		if (curSelected < 0)
			curSelected = freeplayCats.length - 1;
		if (curSelected >= freeplayCats.length)
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