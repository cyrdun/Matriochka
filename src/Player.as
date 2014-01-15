package
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	
	public class Player extends FlxSprite
	{
		[Embed(source = 'assets/matriochkaDefaultAnimation.png')] private var playerPNG:Class;
		
		public var jumping:Boolean;
		
		
		public function Player(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			
			super(X,Y);
			loadGraphic(playerPNG,true,true,220,300,true);
			
			addAnimation("Default",[0],15,true);
			addAnimation("Running",[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],10,false);
			play("Default");
			
			

			//this.makeGraphic(10,12,0xffaa1111);
			this.maxVelocity.x = 460;
			this.maxVelocity.y = 200;
			this.acceleration.y = 200;
			this.drag.x = this.maxVelocity.x*4;
		}
		
		override public function update():void
		{
			if (FlxG.keys.RIGHT)
			{
				facing=RIGHT;
				play("Running");
			}
			else if (FlxG.keys.LEFT)
			{
				facing=LEFT;
				play("Running");
			}
			else
			{
				play("Default");
			}
		}
			
	}
}