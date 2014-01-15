package
{
	import org.flixel.FlxSprite;
	
	public class Background extends FlxSprite
	{
		public function Background(X:Number, Y:Number, Bg:Class,BackgroundScrollX:Number,BackgroundScrollY:Number)
		{
			super(X, Y);
			loadGraphic(Bg, false, false);					//False parameteer means this is not a sprite sheet
			scrollFactor.x = BackgroundScrollX;
			scrollFactor.y = BackgroundScrollY;
			solid = false; 
		}
	}
}