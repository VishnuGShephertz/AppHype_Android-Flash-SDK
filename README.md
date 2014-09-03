AppHypeSDK
==========

1. Opens an easy gateway for Android developers to serve a quality Video & FullScreen Ads.
2. Leads a developer to earn stacks of money by serving a targeted ad that a user wants to see.
3. Offers a solution to the Advertiser by showcasing their Ads to an app user.
4. Read complete [API Documentation](http://apphype.shephertz.com/docs) on AppHype Ad Network Guide.
5. A complete [Turtorial](http://apphype.shephertz.com/tutorial-flash), How you can integrate it in your Existing Android Application.

# Running Ad Sample

1. [Register/Login](http://apphype.shephertz.com/login) to use AppHype.
2. After signing up, create App(s) that you want to promote by submitting App's package name on  [Create App ](http://apphype.shephertz.com/app/apps#/addApp)page.
3. Create [Cross Promotion Campaign ](http://apphype.shephertz.com/app/apps#/createPromo)of the added App(s) to promote it in other App(s) 
4. Now, create another App(s) by adding it on [Create App ](http://apphype.shephertz.com/app/apps#/addApp)in which you wish to cross promote
5. You will get [Application Keys](http://apphype.shephertz.com/app/apps#/all) after App creation for SDK integration, which will be needed to initialize AppHype SDK
6. Download [Flash Android SDK] (https://github.com/VishnuGShephertz/AppHype_Android-Flash-SDK/archive/master.zip) with Sample Application
7. Open Sample Application in your Flash-Builder
8. Change Sample Application id in AppHypeTest-app.xml file with the application package created in step 4 at line no      18. 
9. Change Sample Application id in AppHypeTest-app.xml file with the application package name created in step 4
10. Add AppHype.Ane Android Native Extension in your Sample if Not Added from downloaded SDK.
11. Put your API and Secret Key of the App created in step 4 in AppHypeTest.as file
12. Build your Flash Android application and install it in your device
13. Click on Load button of sample application, you will get the ad of the App(s) created in step 2

# To use AppHype SDK in existing Flash/Action-Script Android Application

__1.__ Download AppHype Flash Android [SDK] (https://github.com/VishnuGShephertz/AppHype_Android-Flash-SDK/archive/master.zip)

__2.__ Add AppHype.ane(Android Native Extension) in your existing Flash/Action-Script mobile application

__3.__ Change Sample Application id in Main-app.xml file with the application package created in step 4.

```
<id>Your Application Package</id>  

```

__4.__ Copy the code given below in Main-app.xml
```
 //Add Android Permissions  
<uses-permission android:name="android.permission.INTERNET">  
</uses-permission>  
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE">  
</uses-permission>  
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION">  
</uses-permission>  
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION">  
</uses-permission>  
  
//Add Android Activities  
<activity android:name="com.shephertz.android.apphype.sdk.InterstitialAdActivity" android:configchanges="keyboardHidden|orientation|screenSize|smallestScreenSize">  
</activity>  
<activity android:name="com.shephertz.android.apphype.sdk.VideoAdActivity" android:configchanges="keyboardHidden|orientation|screenSize|smallestScreenSize" android:screenorientation="landscape"
</activity>  
  
//Add Android Receiver  
<receiver android:name="com.shephertz.android.apphype.sdk.AppHypeReceiver">  
    <intent-filter>  
        <data android:scheme="package">  
        <action android:name="android.intent.action.PACKAGE_ADDED">  
    </action></data></intent-filter>  
</receiver>  
 
```

__5.__ Now, create AppHype object and initialize AppHype SDK with the application Keys of the App in which you are cross promoting
```
      var appHype:AppHype=new AppHype();  
      appHype.Initialize("API_KEY","SECRET_KEY");  
```

__6.__ To enable logs in application
```
appHype.enableLogs();

```

__7.__ To handle callBack events from AppHype SDK, add events and define these Functions

```
    appHype.addEventListener(AppHypeEvent.Available, onAvailable);  
    appHype.addEventListener(AppHypeEvent.Hide, onHide);  
    appHype.addEventListener(AppHypeEvent.IntegrationError, onIntegrationError);  
    appHype.addEventListener(AppHypeEvent.LoadFailed, onLoadFailed);  
    appHype.addEventListener(AppHypeEvent.Show, onShow);  
    appHype.addEventListener(AppHypeEvent.ShowFailed, onShowFailed);  

```

__8.__ Define Function declared above to trace callBack from AppHype

```
       private function onAvailable(event:AppHypeEvent):void  
    {  
        tarce("onAvailable : "+event.getMessage());  
    }  
      
    private function onShow(event:AppHypeEvent):void  
    {  
        trace("onShow : "+event.getMessage());  
    }  
      
    private function onHide(event:AppHypeEvent):void  
    {  
        trace("onHide : "+event.getMessage());  
    }  
    private function onIntegrationError(event:AppHypeEvent):void  
    {  
        trace("onIntegrationError : "+event.getMessage());  
    }  
      
    private function onLoadFailed(event:AppHypeEvent):void  
    {  
        trace("onLoadFailed : "+event.getMessage());  
    }  
      
    private function onShowFailed(event:AppHypeEvent):void  
    {  
        trace("onShowFailed : "+event.getMessage());  
    }    

```

__9.__ Developer can put restrictions on when to show ads in App(s)
```
appHype.restrictAd(restricLaunch);

```

__10.__ To show ads in application, developer has to preLoad them e.g Video or Interstitial
```
    //Make a request for Video Ad  
     appHype.preLoadAd(AdCode.Video);  
    //Make a request for Interstitial Ad  
     appHype.preLoadAd(AdCode.Interstitial);;  ;

```
__11.__ Developer can show ads in application only if, they are available
```
  if(AppHype.isAvailable(AdCode.Video))  
appHype.showAd(AdCode.Video);  
//Show Interstitial Ad  
if(AppHype.isAvailable(AdCode.Interstitial))  
appHype.showAd(AdCode.Interstitial); 
```
__12.__ Developer can close Ad with API as well
```
	appHype.closeAd();
	
```

			



