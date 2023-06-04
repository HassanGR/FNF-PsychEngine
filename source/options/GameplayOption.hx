package options;

class GameplayOption extends Option
{
    public function new(name:String, description:String = '', variable:String, type:String = 'bool', defaultValue:Dynamic = 'null variable value', ?options:Array<String> = null)
    {
        super(name, description, variable, type, defaultValue, options);
    }

    public override function getValue():Dynamic
    {
        return ClientPrefs.getGameplaySetting(variable, false);
    }

    public override function setValue(value:Dynamic)
    {
        ClientPrefs.gameplaySettings.set(variable, value);
    }
}