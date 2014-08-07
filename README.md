AppHypeSDK
==========

# About AppHype Ad SDK Version 1.0

1. Opens an easy gateway for Android developers to serve a quality Video & FullScreen Ads.
2. Leads a developer to earn stacks of money by serving a targeted ad that a user wants to see.
3. Offers a solution to the Advertiser by showcasing their Ads to an app user.
4. Read complete [API Documentation](http://50.112.109.96:8080/docs) on AppHype Ad Network Guide.
5. A complete [Turtorial](http://50.112.109.96:8080/tutorial-flash), How you can integrate it in your Existing Android Application.

# Running Ad Sample

1. [Register/Login](http://50.112.109.96:8080/login) with AppHype Ad Network.
2. After signing up, Create your app that you want to promote by entering your app's package name to the [Create App](http://50.112.109.96:8080/App42Hype/app/apps#/addApp) page.
3. Now You can create Cross Promo Campaign of this App to promote it in Other App.Create [Cross Promotion Campaign](http://50.112.109.96:8080/App42Hype/app/apps#/createPromo) page. 
4. Create your App(s) by entering the name of your App's package to [Create App](http://50.112.109.96:8080/App42Hype/app/apps#/addApp) page.
5. Now you can get Your [Application Keys](http://50.112.109.96:8080/App42Hype/app/apps#/all) on By clicking Key of app, that are require for Ad SDK integration.
6. Download  AppHype Flash Android [SDK] (https://github.com/VishnuGShephertz/AppHype_Android-Flash-SDK/tree/Version-1.0/archive/master.zip) with Sample Application.
7. Open Sample Application in your Flash-Builder.
8. Change Sample Application id in AppHypeTest-app.xml file with the application package created in step 4 at line no 18. 

9. Change Sample Application id in AppHypeTest-app.xml file with the application package created in step 4 at line no 18.
10. Add AppHype.Ane Android Native Extension in your Sample if Not Added from downloaded SDK
11. Build your Android Application and run it on your device,Device must have the Flash AIr support.
12. By Clicking Load button of sample application, you are able to get Ad of App that campaign create in step 3.

# Android AppHype SDK Integration



__1 Download  AppHype Flash Android [SDK] (https://github.com/VishnuGShephertz/AppHype_Android-Flash-SDK/tree/Version-1.0/archive/master.zip)__

__2 Add AppHype.ane (Android Native Extension in your Existing Flash/ActionScript Mobile application.__

__3 Modify Android Manifest__ Change Sample Application id in Main-app.xml file with the application package created in step 4 at line 18 as well add:


Add permissions 
```
 <uses-permission android:name="android.permission.INTERNET"></uses-permission>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"></uses-permission>
 <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
   <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

Add Activities

```
  <activity android:name="com.shephertz.android.apphype.sdk.InterstitialAdActivity" android:configChanges="keyboardHidden|orientation|screenSize|smallestScreenSize" />
        <activity android:name="com.shephertz.android.apphype.sdk.VideoAdActivity" android:screenOrientation="landscape"
             android:configChanges="keyboardHidden|orientation|screenSize|smallestScreenSize" />
```
Add Receiver

```
 <receiver android:name="com.shephertz.android.apphype.sdk.AppHypeReceiver">
            <intent-filter>
                <data android:scheme="package"/>
                <action android:name="android.intent.action.PACKAGE_ADDED"/>
            </intent-filter>
        </receiver>
```

__4 Intialize AppHype__ First Create AppHype Object that can be used further. and initialize it with your application Keys from step 5, in your Application.
```
      var appHype:AppHype=new AppHype();  
      appHype.Initialize("API_KEY","SECRET_KEY");  
```

__5 Enable Logs__ While integrating AppHype Sdk you can also enable Sdk logs.

```
appHype.enableLogs();

```
__6 Add events__ In order to handle various callBack from AppHype SDK You can add events as well as define these Functions as well..

```
    appHype.addEventListener(AppHypeEvent.Available, onAvailable);  
    appHype.addEventListener(AppHypeEvent.Hide, onHide);  
    appHype.addEventListener(AppHypeEvent.IntegrationError, onIntegrationError);  
    appHype.addEventListener(AppHypeEvent.LoadFailed, onLoadFailed);  
    appHype.addEventListener(AppHypeEvent.Show, onShow);  
    appHype.addEventListener(AppHypeEvent.ShowFailed, onShowFailed);  

```

__7 Define Events Functions for callBack__ In order to handle various callBack from AppHype SDK You can add events as well as define these Functions as well.

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

__8 Restrict Ad in Application__ You can also set maximum no. of application launch till you don’t want any Ad. This is an interesting feature to engage users in your app.
```
appHype.restrictAd(restricLaunch);

```

__9 LoadAd__ You can request Ad by using the following code.

```
    //Make a request for Video Ad  
     appHype.preLoadAd(AdCode.Video);  
    //Make a request for Interstitial Ad  
     appHype.preLoadAd(AdCode.Interstitial);;  ;

```
__10 ShowAd__ If you want to show it on an event then you can use the following code.

```
  if(AppHype.isAvailable(AdCode.Video))  
appHype.showAd(AdCode.Video);  
//Show Interstitial Ad  
if(AppHype.isAvailable(AdCode.Interstitial))  
appHype.showAd(AdCode.Interstitial); 
				
```
__11 CloseAd__  If you want to close this by using Api you can use following code.

```

	appHype.closeAd();
				
```

			



