package
{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		[Embed(source = "/img/bg1.png")] public var Background1:Class;
		
		public var level:FlxGroup;
		public var ground:FlxSprite;
		public var obstacle:FlxSprite;
		public var player:Player;
		public var map:FlxTilemap;
		
		public var bg:Background;
		
		public function PlayState()
		{
			super();
			
		}
		override public function create():void
		{
			
			super.create();
			bg=new Background(0,0,Background1,1,0);
			
			
			
			
			add(bg);
			
			level=new FlxGroup();
			
			ground=new FlxSprite(0,734);
			ground.makeGraphic(2712, 90,0x00000000);
			ground.immovable=true;
			ground.scrollFactor.x=ground.scrollFactor.y=0;
			
			obstacle=new FlxSprite(2420,380);
			obstacle.makeGraphic(380,800,0x00000000);
			obstacle.immovable=true;
			//obstacle.moves=false;
			obstacle.scrollFactor.x=obstacle.scrollFactor.y=0;
			
			
			level.add(ground);
			level.add(obstacle);
			level.setAll("scrollFactor", new FlxPoint(1, 0));
			add(level);
			
			
			add(ground);
			add(obstacle);
			
			
			/*map = new FlxTilemap();
			var bData:BitmapData=new BitmapData(ground.width,ground.height);
			bData.draw(ground as Bitmap);
			map.loadMap(FlxTilemap.bitmapToCSV(bData),FlxTilemap.ImgAuto,0,0,FlxTilemap.AUTO);*/
			
			player = new Player(300,428);
			/*player.x=300;
			player.y=424;*/
			add(player);
			
			FlxG.bgColor = 0xffaaaaaa;
			FlxG.camera.setBounds(0,0,2712,768,true);
			FlxG.camera.follow(player,FlxCamera.STYLE_PLATFORMER);
			FlxG.worldBounds = new FlxRect(0, 0, bg.width, bg.height);
			
			
		}
		
		override public function update():void
		{
			player.acceleration.x = 0;
			if(FlxG.keys.LEFT)
				player.acceleration.x = -player.maxVelocity.x*4;
			if(FlxG.keys.RIGHT)
				player.acceleration.x = player.maxVelocity.x*4;
			if(FlxG.keys.SPACE && player.isTouching(FlxObject.FLOOR))
				player.velocity.y = -player.maxVelocity.y/2;
			
			super.update();
			
			
			FlxG.collide(level,player);
		}
	}
}