package abstract
{
	import Box2D.*;
	import org.flixel.FlxSprite;
	import flash.events.*;
	
	public class AbstractMatriochka extends FlxSprite
	{
		static public const STATECHANGE:String="state_change";
		static public const STATES:Array=["inside","outside","master"];
		static public const SIZES:Array=["S","M","L"];
		
		protected var _currentState:String;
		protected var _size:String;
		
		public var jumping:Boolean;
		
		public function AbstractMatriochka(X:Number=0, Y:Number=0, SimpleGraphic:Class=null)
		{
			super();
		}
		
		
		/***********
		State changes :
		 **********/
		
		public function set state(newState:String):void
		{
			if (!(AbstractMatriochka.isAllowedState(newState))) return;
			if (!(this.isCurrentState(newState))) return;
			else
			{
				this._currentState=newState;
			}
		}
		
		protected static function isAllowedState(sentState:String):Boolean
		{
			var allowed:Boolean=false;
			for each(var state:String in AbstractMatriochka.STATES)
			{
				if (sentState==state) allowed=true;
			}
			return allowed;
		}
		
		protected function isCurrentState(sentState:String):Boolean
		{
			var current:Boolean=false;
			if (sentState==this._currentState) current=true;
			
			return current;
		}	
		
		
		/***********
		 Initializing :
		 **********/
		
		public function set size(s:String):void
		{
			if (!(AbstractMatriochka.isAllowedSize(s))) return;
			else
			{
				this._size=s;
			}
		}
		
		protected static function isAllowedSize(sentSize:String):Boolean
		{
			var allowedSize:Boolean=false;
			for each(var size:String in AbstractMatriochka.SIZES)
			{
				if (sentSize==size) allowedSize=true;
			}
			
			return allowedSize;
		}
		
		
	}
}