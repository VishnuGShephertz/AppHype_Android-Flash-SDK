package
{
	import com.shephertz.apphype.AdCode;
	import com.shephertz.apphype.AppHype;
	import com.shephertz.apphype.AppHypeEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormatAlign;
	
	public class AppHypeTest extends Sprite
	{
		private var text:TextField = null;
		private var hype:AppHype = null;
		
		public function AppHypeTest()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			var btnWidth:int = (stage.fullScreenWidth - 30) / 2;
			var btnHeight:int = 48;
			
			addChild(createButton("Load Interstitial Ad", 10,10,btnWidth,btnHeight,onLoadInterstitialAdBtn_Clicked));
			addChild(createButton("Load Video Ad", 10+btnWidth+10,10,btnWidth,btnHeight,onLoadVideoAdBtn_Clicked));
			addChild(createButton("Show Interstitial Ad", 10,10+btnHeight+10,btnWidth,btnHeight,onShowInterstitialAdBtn_Clicked));
			addChild(createButton("Show Video Ad", 10+btnWidth+10,10+btnHeight+10,btnWidth,btnHeight,onShowVideoAdBtn_Clicked));
			
			text = new TextField();
			text.text = "Press a Button";     
			text.width = btnWidth * 2;
			text.height = btnHeight;
			text.x = 10;
			text.y = 10+btnHeight+10+btnHeight+10; 
			
			addChild(text);
			
			hype = new AppHype();
			hype.intialize("Your Api Key","Your Secret Key");
			hype.addEventListener(AppHypeEvent.Available, onAvailable);
			hype.addEventListener(AppHypeEvent.Hide, onHide);
			hype.addEventListener(AppHypeEvent.IntegrationError, onIntegrationError);
			hype.addEventListener(AppHypeEvent.LoadFailed, onLoadFailed);
			hype.addEventListener(AppHypeEvent.Show, onShow);
			hype.addEventListener(AppHypeEvent.ShowFailed, onShowFailed);
			hype.enableLogs();
		}
		
		private function createButton(caption:String, x:int, y:int,width:int,height:int, click:Function):TextField
		{
			var txtField:TextField = new TextField();
			txtField.text = caption;     
			txtField.width = width;
			txtField.height = height;
			txtField.x = x;
			txtField.y = y;
			txtField.textColor = 0xFFFFFF;
			txtField.background = true;
			txtField.backgroundColor = 0x34495E;
			txtField.addEventListener(MouseEvent.CLICK, click);
			return txtField;
		}
		
		private function onLoadInterstitialAdBtn_Clicked(event:MouseEvent):void
		{
			text.text = "Loading Interstitial Ad ...";
			hype.loadAd(AdCode.Interstitial);
		}
		
		private function onLoadVideoAdBtn_Clicked(event:Event):void
		{
			text.text = "Loading Video Ad ...";
			hype.loadAd(AdCode.Video);
		}
		
		private function onShowInterstitialAdBtn_Clicked(event:Event):void
		{
			if(hype.isAvailable(AdCode.Interstitial)){
				text.text = "Showing Interstitial Ad ...";
				hype.showAd(AdCode.Interstitial);
			}
			else{
				text.text = "Ad is not ready";
			}
		}
		
		private function onShowVideoAdBtn_Clicked(event:Event):void
		{
			if(hype.isAvailable(AdCode.Video)){
				text.text = "Showing Video Ad ...";
				hype.showAd(AdCode.Video);
			}
			else{
				text.text = "Ad is not ready";
			}
		}
		
		private function onAvailable(event:AppHypeEvent):void
		{
			text.text = "onAvailable : AdCode is "+event.getMessage();
		}
		
		private function onShow(event:AppHypeEvent):void
		{
			text.text = "onShow : AdCode is "+event.getMessage();
		}
		
		private function onHide(event:AppHypeEvent):void
		{
			text.text = "onHide : AdCode is "+event.getMessage();
		}
		private function onIntegrationError(event:AppHypeEvent):void
		{
			text.text = "onIntegrationError : "+event.getMessage();
		}
		
		private function onLoadFailed(event:AppHypeEvent):void
		{
			text.text = "onLoadFailed : "+event.getMessage();
		}
		
		private function onShowFailed(event:AppHypeEvent):void
		{
			text.text = "onShowFailed : "+event.getMessage();
		}
	}
}