package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author  Bernardo
	 */
	public class Ball extends Sprite
	{
		private var angle: int;
		public var speed: int;
		
		public var xIncrement: int;
		public var yIncrement: int;
		
		public function Ball()
		{
			graphics.beginFill(0x000000);
			graphics.drawCircle(0, 0, 5);
			graphics.endFill();
			
			angle = Math.random() * 360;
			speed = 10;

			xIncrement = Math.sin(angle) * speed;
			yIncrement = Math.cos(angle) * speed;
		}
		
		public function setAngle(angle:int):void
		{
			this.angle = angle;
			xIncrement = Math.sin(angle) * speed;
			yIncrement = Math.cos(angle) * speed;
		}
		
		public function move():void
		{
			if (this.x >= stage.stageWidth || this.x <= 0)
			{
				xIncrement *= -1;
			}			
			if (this.y >= stage.stageHeight || this.y <= 0)
			{
				yIncrement *= -1;
			}
			
			this.x += xIncrement;
			this.y += yIncrement;
		}
		
		public function negateIncrementX():void
		{
			xIncrement *= -1;
		}
	}
	
}