---
author: admin
comments: true
date: 2014-04-04 19:02:29+00:00
excerpt: How to make the process of publishing Android apps with OpenFL as painless
  as possible.
layout: post
slug: openfl-android-tips-and-tricks
title: 'OpenFL: Android Tips and Tricks'
wordpress_id: 1873
categories:
- Development
tags:
- actionscript
- android
- flappybalt
- haxe
- haxeflixel
- lime
- mobile
- openfl
---

[OpenFL](http://www.openfl.org/) is great. It's the engine behind [rymdkapsel](http://rymdkapsel.com/) and [BAFTA winner](http://awards.bafta.org/award/2014/games/strategy-and-simulation) [Papers, Please](http://papersplea.se/), as well as [many other games](http://www.openfl.org/showcase/), including my own [Don't Move](http://steverichey.com/dontmove/). OpenFL, via the cross-platform power of programming language [Haxe](http://haxe.org/), exposes the [Flash API](http://help.adobe.com/en_US/FlashPlatform/reference/actionscript/3/) for all platforms. Since [Haxe is so similar to Actionscript 3](http://haxe.org/doc/start/flash/as3migration/part1), you can apply your Flash knowledge to create apps for Windows, Mac, Linux, Android, iOS, Ouya, and even Blackberry.  However, testing and deploying for Android can be tricky and time-consuming if you don't know a few tricks.



# The Basics



I'll assume you're familiar enough with OpenFL that you've got a working project ready to go, whether it only uses OpenFL, or an additional library like [HaxeFlixel](http://haxeflixel.com/) or [HaxePunk](http://haxepunk.com/). If not, I'm working on a [tutorial series](http://www.steverichey.com/dev/intro-to-game-programming-with-haxe-part-1/) that could help you, but it's not done yet. If you need an example project to get started with, you can download [my port of Flappybalt](https://github.com/steverichey/Flappybalt/archive/master.zip), just make sure you [install Haxe](http://haxe.org/download) and run:
[code]haxelib install lime
haxelib run lime setup
lime install openfl
haxelib install flixel[/code] from the command line first to get ready.

Before you can build for Android, you need to run the command: [code]lime setup android[/code]
This will ask you to install the [Android SDK](https://developer.android.com/sdk/index.html?hl=sk), [Android NDK](https://developer.android.com/tools/sdk/ndk/index.html), [Apache Ant](http://ant.apache.org/), and the [Java JDK](http://www.oracle.com/technetwork/java/javase/downloads/index-jsp-138363.html), and define the path to each. For most installations, these will be:





  * C:\Development\Android SDK


  * C:\Development\Android NDK


  * C:\Development\Apache Ant


  * C:\java\jdk1.6.0_37



If you're getting an error about not being able to find Java, make sure your path to the Java JDK looks something like above, and _not_ to the bin/ directory, as that won't work. At this point, you should be able to run "lime build android" from the command prompt and after a bit of a wait, find a valid APK file in your export directory (usually something like export\android\bin\bin\MyApp-debug.apk). It's named "-debug" because we haven't signed for release yet, but we'll get to that soon.



# Testing



First of all, you can run "lime build android -emulator" to test your app in an emulated Android environment, which is handy, but likely to be slow on most machines (it runs at about 1 fps on my decrepit laptop) so it might not be a great solution. If you don't want a lengthy setup or you're just getting your feet wet, you can email your APK to yourself and open it on your mobile device, which is simple enough but time-consuming if you're doing a lot of bug testing. Instead, I'd recommend you use [ADB](https://developer.android.com/tools/help/adb.html) to automate most of your process. By the time we're done, you'll be able to send your APK to your device over WiFi, _and_ launch it, just by running a batch file. Let's get started!





  1. Connect your Android device to your computer via USB.


  2. Enable USB debugging in your device, which is an option in the Settings menu in older devices. On newer devices ([as of Android 4.2](http://developer.android.com/tools/index.html)) the developer menu is hidden until you go to Settings -> About Device and tap "Build Number" seven times. Yes, it's silly, just do it.

[![Screenshot_2014-04-03-19-49-13](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-19-49-13-168x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-19-49-13.png)

[![Screenshot_2014-04-03-19-49-26](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-19-49-26-168x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-19-49-26.png)

Then in the newly-enabled Developer Options menu, select "USB debugging" to enable it.

[![Screenshot_2014-04-03-19-49-46](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-19-49-46-168x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-19-49-46.png)

You're not done yet! You'll likely need drivers for your computer, which your phone may install automatically. If not, you'll have to search for them. I was able to find the drivers for my Samsung Galaxy SIII [here](http://www.samsung.com/us/support/owners/product/SPH-L710MBBSPR), for example.


  3. Add the ADB path to your environment variables so you can run it from anywhere. If you're not familiar, you can access the environment variables in Windows by pressing the Start button, doing a search for 'environment', and pressing enter.

[![environment_start](http://www.steverichey.com/wp-content/uploads/2014/04/environment_start-221x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/environment_start.png)

Then, in either the user or system variables, add a new one called ADB_PATH with the value of the path to ADB, usually C:\Development\Android SDK\platform-tools\.

[![environment_adb_path](http://www.steverichey.com/wp-content/uploads/2014/04/environment_adb_path-271x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/environment_adb_path.png)

Then, edit the 'Path' variable, and add ";%ADB_PATH%" (without quotes) to the end.

[![environment_all_pat](http://www.steverichey.com/wp-content/uploads/2014/04/environment_all_pat-271x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/environment_all_pat.png)

You could just add the path to ADB itself, but I find having variables for each path helps if you need to change things around in the future. If you've got a command prompt open already, you'll probably need to close it and re-open before the change will take effect. Type "adb" in a command prompt window and see what happens.

[![environment_adb_working](http://www.steverichey.com/wp-content/uploads/2014/04/environment_adb_working-300x151.png)](http://www.steverichey.com/wp-content/uploads/2014/04/environment_adb_working.png)

If you get a bunch of options and information, congratulations! You did it.


  4. Open the command prompt, and start ADB in USB mode by typing "adb usb". On my computer, this just seemed to freeze, so I just waited a minute, closed the window, and then opened a new one. Now type "adb devices"; if you see a device listed, so far so good! If not, you may have messed up a step above.

Assuming it works, you now want to type "adb tcpip 5555" to restart ADB in TCP mode, on port 5555. Again, if it freezes just give it a bit then restart your command prompt. Now, on your Android device, under Settings, go to About Device -> Status and scroll down to the IP address. It will probably be something like '192.168.1.' and then a number.

Back on your computer, type "adb connect" and then the IP address; in my case it was "adb connect 192.168.1.146". Now, disconnect your USB, and type "adb devices" again. If you still see your device listed (usually as the IP address followed by 5555), congrats! You can now wirelessly debug your app!


  5. Now we're going to create a batch file that you can use for testing. If you're using [FlashDevelop](http://flashdevelop.org/) (you should) you can Ctrl+N and then save as "test.bat" or something similar. We then want to add the following lines to our new file:

[code]
adb connect 192.168.1.146:5555
adb shell am force-stop com.steverichey.flappybalt
adb shell am start -a android.intent.action.DELETE -d package:com.steverichey.flappybalt
adb shell input tap 464 786
adb install Export/android/bin/bin/Flappybalt-release.apk
adb shell am start -n com.steverichey.flappybalt/com.steverichey.flappybalt.MainActivity
[/code]

Let's break this down, line-by-line, since I'm throwing a lot at you. That first line just re-connects you to your device, in case you've walked away and come back since your last build. If you're already connected, you'll just get a message telling you as such.

The second line will stop your app if it's already running, since we can't delete it until it's closed, and we can't install a new version until the old one is deleted. Obviously, you would change the package name (in this case, that's com.steverichey.flappybalt) to match the one for your app.

The third line deletes the old version of the app. If you try to install an existing app via ADB, you'll just get an error, which is not what we want.

The fourth line is a trick I'm pretty proud of. When you try to delete an app via ADB, you'll get a popup so you can cancel or confirm the action. This just slows down the development cycle! So here, we're using ADB's ability to simulate touch input to press the "Ok" button when it shows. Those two numbers are X and Y values for the input position. How did I get those? In the Developer Options menu of your device, you can select the "Show pointer location" option to get a bunch of information on the touch inputs. 

[![Screenshot_2014-04-03-20-50-47](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-20-50-47-168x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-03-20-50-47.png)

After enabling this, pull up the dialog box by running the third line of the batch file from your command prompt, then hold your finger down on the "Ok" button.

[![Screenshot_2014-04-04-09-18-29](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-04-09-18-29-168x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/Screenshot_2014-04-04-09-18-29.png)

When you find a good X and Y value, just put those in the batch file, and you've automated deleting the app!

The fifth line installs your app. Make sure the path to your APK is valid, and you're good to go.

The final line starts your app by calling the MainActivity, which is the OpenFL-generated launching off point for your app. Once you've got this all configured, you can just type "test" on the command prompt while in your project directory, or even better, run the batch file automatically after you compile (assuming you use FlashDevelop) by putting "$(ProjectDir)\test.bat" (_with_ quotes) in the post-build command line options under Project Properties -> Build.

[![fd_proj_prop](http://www.steverichey.com/wp-content/uploads/2014/04/fd_proj_prop-300x203.png)](http://www.steverichey.com/wp-content/uploads/2014/04/fd_proj_prop.png)

[![fd_proj_prop_2](http://www.steverichey.com/wp-content/uploads/2014/04/fd_proj_prop_2-293x300.png)](http://www.steverichey.com/wp-content/uploads/2014/04/fd_proj_prop_2.png)

If you've got all that set up, congrats! Now you can press the "Test Project" button, waste a few minutes reading Twitter, and before you know it your app will be running on your phone.



# Prepping for Release



If you want your app in [Google Play](https://play.google.com/store), you'll need to sign your app for release. This helps to ensure some other third party doesn't upload malware under your name if they get access to your account. Luckily, Java has a built in tool for generating public/private key pairs called keytool. [Google recommends](http://developer.android.com/tools/publishing/app-signing.html) generating your signing keys with the following settings:

[code]
keytool -genkey -v -keystore YOUR_RELEASE_KEY.keystore -alias YOUR_ALIAS -keyalg RSA -keysize 2048 -validity 10000
[/code]

Where "YOUR_RELEASE_KEY" is the name of the file that will be generated (it can by anything) and "YOUR_ALIAS" is like a username for accessing the keystore. It's very important that you remember these. Keytool will ask for some information and a password, don't forget the latter!  Now, to get OpenFL to use this key to sign your app, add the following line to your Project.XML file:

[code]
<certificate path="YOUR_RELEASE_KEY.keystore" alias="YOUR_ALIAS" password="YOUR_PASSWORD" if="android" unless="debug"/>
[/code]

Using your own values where appropriate. Obviously, you should not add the keystore file or the certificate alias and password to any source control repository if you plan on open-sourcing your project, ever. I'd recommend adding *.keystore and Project-Private.xml to your ignore file (.gitignore for git, global-ignores in your config file for svn, .hgignore for Mercurial), having two copies of Project.XML (one without the certificate, and one with) and using [code]lime build Project-Private.xml android[/code] to build your app for release. When OpenFL signs your app, it will be titled "MyApp-release.apk" instead of "MyApp-debug.apk".



# Uploading to Google Play



Thankfully, uploading your app is fairly painless. You'll need a [Google Play Developer Console account](https://play.google.com/apps/publish/signup/), which is currently $25, with no annual fee. After you've signed up, you can go to [your Developer Console](https://play.google.com/apps/publish/) to upload apps. The process is fairly painless, you'll only need a few screenshots, a 512x512 icon, a 1024x500 feature graphic, and a 180x120 promo graphic. You can also add a YouTube video, set pricing, and so on. When you upload your APK, the embedded icon will be used for the store (see below for information on setting your APK's icon). After everything's set, you'll have to wait a bit before your app shows up in the store, but it should only be a few hours.



# Creating a Good Icon



I'm a big fan of [good SVG icons](http://www.steverichey.com/dev/vector-logos/), and OpenFL will use [SVGs](http://www.w3.org/TR/SVG11/) to generate icons if one is found. By default, OpenFL includes an icon via Project.XML:

[code]
<icon path="Assets/openfl.svg" />
[/code]

You can override this with whatever icon you create, either by hand or via [InkScape](http://inkscape.org/en/). SVG is based on XML, so, for example, the logo for my port of [Gama11](https://twitter.com/Gama11_)'s [MinimalistTD](https://github.com/HaxeFlixel/flixel-demos/tree/dev/Other/MinimalistTD) looks like this:

[code]
<svg xmlns="http://www.w3.org/2000/svg" width="6" height="6" version="1">
<rect width="6" height="6" x="0" y="0" fill="#000000"/>
<rect width="1" height="1" x="1" y="3" fill="#ffffff"/>
<rect width="1" height="1" x="4" y="3" fill="#ffffff"/>
</svg>
[/code]

Using rect is an easy way to create pixel art if you want blocky graphics that aren't blurry. Obviously this is a very simple example, but if you need more information you could check out my [page dedicated to SVG logos I've made](http://www.steverichey.com/dev/vector-logos/) or the [Flappybalt icon](https://github.com/steverichey/Flappybalt/blob/master/assets/icon.svg).



# Removing App Permissions



When you install an app from Google Play, you'll get a screen of scary warnings about stuff the app will be allowed to access. If you're doing in-app purchases, ads, or multiplayer, you'll need these app permissions in order for these features to function. If not, you can override the default OpenFL permissions pretty easily. After you've built your app for Android at least once, grab export/android/bin/bin/AndroidManifest.xml and copy it somewhere else (I usually put it into a libs directory). Then, in your Project.XML, add:

[code]
<template path="libs/AndroidManifest.xml" rename="AndroidManifest.xml" if="android"/>
[/code]

Now Lime will use this file instead of the default AndroidManifest it would normally generate. Inside this file you'll notice a few lines:

[code]
<uses-permission android:name="android.permission.WAKE_LOCK"/>
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.VIBRATE"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
[/code]

**As far as I know** you can delete these lines without issue. If you do this, when someone goes to launch your app, it will say "This app requires no special permissions", which is a good way to show that you're not harvesting their personal info.

That's everything! Soon I'll upload a second Android-related tutorial about using OpenFL's JNI to access Java code at runtime, which lets you do neat stuff like adjusting screen brightness or accessing the camera. Thanks for reading, and if you need help with anything, feel free to leave a comment!
