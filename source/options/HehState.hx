package options;
using StringTools;

class HehState extends BaseOptionsMenu
{

	public function new()
	{
		title = 'Heh Menu';
		rpcTitle = 'Heh Settings Menu'; //for Discord Rich Presence

		//I'd suggest using "Downscroll" as an example for making your own option since it is the simplest here
		var option:GameplayOption = new GameplayOption('Botplay', //Name
            'Enable botplay because you are a cheater >:)', //Description
            'botplay', //Save data variable name
            'bool', //Variable type
            false); //Default value
        addOption(option);

        super();
    }
    
}