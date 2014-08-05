package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.events.KeyboardEvent;
	import flash.display.Shape;
	import flash.text.TextField;
	import flash.utils.Timer;
	
	/**	 
	 * @author  Bernardo
	 */
	public class Game extends Sprite
	{
		private var p:Paddle;
		private var b:Ball;
		private var t:TextField;
		private var up:Boolean;
		private var down:Boolean;
		
		public function Game() : void
		{
			stage.stageWidth = 300;
			var fps:FPSBox = new FPSBox();
			addChild(fps);
			
			b = new Ball();
			b.x = 150;
			b.y = 150;
			addChild(b);
			
			p = new Paddle();
			p.x = 20;
			addChild(p);
			
			t = new TextField();
			t.x = 100;
			t.width = 250;
			t.y = 0;
			t.text = 'paddle y:' + p.y + ' b x:' + b.x + ' b y:' + b.y;
			addChild(t);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpListener);
			stage.addEventListener(Event.ENTER_FRAME, enterFrame);
			
			var clock:Timer = new Timer(5);
			clock.addEventListener( TimerEvent.TIMER, update );
			clock.start();
			trace(width);
			trace(height);
			trace(stage.stageHeight);
			trace(stage.stageWidth);
		}
		
		private function update(e:TimerEvent ):void
		{			
			
		}
		
		private function lose():void
		{
			var l:TextField = new TextField();
			l.x = 150;
			l.y = 150;
			l.text = 'FAIL';
			l.textColor = 0x666666;
			addChild(l);
			removeChild(t);
			removeChild(b);
			removeChild(p);
		}
				
		private function enterFrame(e:Event):void
		{
			if (b.hitTestObject(p))
			{
				var c:Number = b.speed / p.height * Math.sqrt(2);
				trace(c);
				trace(b.yIncrement);
				b.yIncrement = (b.y - p.getCenter()) * c;
				trace(b.yIncrement);
				trace(b.xIncrement);
				if (b.xIncrement < 0)
				{
					b.xIncrement = Math.sqrt(Math.pow(b.speed - b.yIncrement, 2));
				}
				else
				{
					b.xIncrement = -Math.sqrt(Math.pow(b.speed - b.yIncrement, 2));
				}
				trace(b.xIncrement);
			}
			
			p.move(up, down);
			b.move();
			
			//if (b.x == 30)
			//{
				//if (b.y >= p.y && b.y <= p.y + 60)
				//{
					//if (b.y >= p.y && b.y <= p.y + 10)
						//byi = -3;
					//else if (b.y >= p.y && b.y <= p.y + 20)
						//byi = -2;
					//else if (b.y >= p.y && b.y <= p.y + 30)
						//byi = -1;
					//else if (b.y >= p.y && b.y <= p.y + 40)
						//byi = 1;
					//else if (b.y >= p.y && b.y <= p.y + 50)
						//byi = 2;
					//else if (b.y >= p.y && b.y <= p.y + 60)
						//byi = 3;
					//bxi = 1;
				//}
			//}	
			//
			//if (b.x == stage.stageWidth)
			//{
				//bxi = -1;
			//}
			//if (b.x == 0)
			//{
				//bxi = 1;
				//lose();
			//}
			//if (b.y >= stage.stageHeight)
			//{
				//byi = -1;
			//}
			//if (b.y <= 0)
			//{
				//byi = 1;
			//}
			//b.x += bxi;
			//b.y += byi;
			//t.text = 'paddle y:' + p.y + ' b x:' + b.x + ' b y:' + b.y;
		}
		
		private function keyUpListener(e:KeyboardEvent):void
		{
			if (e.keyCode == 87)
			{
				up = false;
			}
			if (e.keyCode == 83)
			{
				down = false;
			}
		}
		
		private function keyDownListener(e:KeyboardEvent):void
		{
			if (e.keyCode == 87)
			{
				up = true;
			}
			if (e.keyCode == 83)
			{
				down = true;
			}
		}
		
	}
	
}