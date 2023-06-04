package options;
using StringTools;

class FrqntUseState extends BaseOptionsMenu
{

	public function new()
	{
		title = 'Frequently Used';
		rpcTitle = 'Options Menu'; //for Discord Rich Presence

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:GameplayOption = new GameplayOption('Botplay', //Name
            'Enable botplay because you are a cheater >:)', //Description
            'botplay', //Save data variable name
            'bool', //Variable type
            false); //Default value
        addOption(option);
        #if !html5 //Apparently other framerates isn't correctly supported on Browser? Probably it has some V-Sync shit enabled by default, idk
		var option:Option = new Option('Framerate',
			"Pretty self explanatory, isn't it?",
			'framerate',
			'int',
			60);
		addOption(option);

		option.minValue = 1;
		option.maxValue = 240;
		option.displayFormat = '%v FPS';
		option.onChange = onChangeFramerate;
		#end
        var option:Option = new Option('Downscroll', //Name
			'If checked, notes go Down instead of Up, simple enough.', //Description
			'downScroll', //Save data variable name
			'bool', //Variable type
			false); //Default value
		addOption(option);

		var option:Option = new Option('Middlescroll',
			'If checked, your notes get centered.',
			'middleScroll',
			'bool',
			false);
		addOption(option);

        super();
    }
}