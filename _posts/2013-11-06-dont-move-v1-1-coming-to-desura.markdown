---
author: admin
comments: true
date: 2013-11-06 19:41:05+00:00
excerpt: The long-awaited update to Don't Move is coming to Desura!
layout: post
slug: dont-move-v1-1-coming-to-desura
title: Don't Move v1.1 Coming to Desura
wordpress_id: 1712
categories:
- Development
tags:
- desura
- development
- don't
- don't move
- game
- gamedev
- indie
- left
- ludonarrative dissonance
- move
- ninja
- ninjas
- player investment
- right
---

Hi there! I am very happy to announce that [Don't Move](http://www.desura.com/games/dont-move) will be coming to [Desura](http://www.desura.com/games/dont-move) on November 22, 2013 for Windows PCs! You can preload it now or visit the game's official page below:

[![Don't Move](http://button.desura.com/play/medium/games/24384.png)](http://www.desura.com/games/dont-move)

Not only that, but this release will be the official v1.1 update, which adds a ton of features, including:




  * Saving and loading


  * Gamepad support


  * Pausing


  * Better volume control


  * Minor trophy changes


  * A bit of help with the game's most confounding puzzle


  * 'A' and 'D' buttons now usable as left/right directions


  * Powered by HaxeFlixel screen


  * Better support for 32-bit systems


  * Massive code improvements and changes



Read on for more information!



# Saving and Loading



One of the most commonly mentioned shortcomings of Don't Move was the lack of saving. If you exited the game, you had to start all over again! This is no longer the case. With v1.1, Don't Move will automatically save every time you "explode" the lock. This little icon, a highly accurate rendition of the Don't Move cartridge, indicates saving:

[![update_01](http://www.steverichey.com/wp-content/uploads/2013/11/update_01.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_01.png)

On the title screen, this icon can be found in the top-left corner, and means that save data has been found:

[![update_02](http://www.steverichey.com/wp-content/uploads/2013/11/update_02.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_02.png)

While you're playing Don't Move, you should see this same icon every time you unlock the next phase of the game:

[![update_03](http://www.steverichey.com/wp-content/uploads/2013/11/update_03.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_03.png)

Of course, you may, at some point, want to erase your saved game. To do this, simply hold down the left and right directions at the title screen:

[![update_04](http://www.steverichey.com/wp-content/uploads/2013/11/update_04.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_04.png)

When the bar is full (it takes a little while, to prevent accidental erasures) release both directional buttons to complete the process and erase your game:

[![update_05](http://www.steverichey.com/wp-content/uploads/2013/11/update_05.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_05.png)

[![update_06](http://www.steverichey.com/wp-content/uploads/2013/11/update_06.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_06.png)

Of course, if at any point while the bar is filling you decide you'd rather not erase your save game just yet, you can release both directional buttons to start the game.



# Gamepad Support



Don't Move v1.1 supports gamepads by default. Many controllers will work with no setup required, such as Xbox controllers and most Logitech controllers. For those controllers that do not work automatically, you may need to use Map Mode, which can be activated by pressing the 'M' key on the title screen:

[![update_07](http://www.steverichey.com/wp-content/uploads/2013/11/update_07.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_07.png)

At that point, if your gamepad has been found by Don't Move, you can press buttons on the controller to see their corresponding key value. Please note that you must plug in your gamepad before starting Don't Move.

[![update_08](http://www.steverichey.com/wp-content/uploads/2013/11/update_08.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_08.png)

When you've identified the key values corresponding to the buttons you'd like to assign to left and right, locate the file Map.XML (located in the game's directory) and open it with any text editor (such as [Notepad++](http://notepad-plus-plus.org/)). You simply need to add an item for each button. There is no limit to the number of buttons you can assign, but if you assign the same button to both directions you're going to have a hard time.

[![update_09](http://www.steverichey.com/wp-content/uploads/2013/11/update_09.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_09.png)

Once that is done, open the game and start using your gamepad! Please note that you may have difficulty with at least one element of the game if you're using a gamepad with a D-pad that can only be pressed in one direction at a time. If your D-pad is like this, I recommend adding some additional buttons for left and right in the XML file. You've been warned!



# Pausing



You may have noticed that Don't Move would automatically pause when you clicked away from the game's window. This "feature" has been disabled. In its place, you may now press 'P' while playing the game to pause.

[![update_10](http://www.steverichey.com/wp-content/uploads/2013/11/update_10.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_10.png)

That is advanced technology right there.



# Better volume control



You may also have noticed that the plus (+), minus (-), and zero (0) buttons changed the volume of the game's music. With v1.1, this has been extended to all of the game's sounds.



# Minor trophy changes



There was a bit of confusion regarding two of the game's trophies, and to help alleviate that somewhat, I've redesigned them.  The old versions of these trophies are below.

[![update_11](http://www.steverichey.com/wp-content/uploads/2013/11/update_11.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_11.png)

So long, old trophies! The new trophies display their relationship to the game a bit better, but the mechanism to unlock them is still the same. However, the Indecision trophy had a glitch where it could be unlocked by "dancing", and this error has been remedied.



# Some puzzle help



I won't spoil it with a screenshot, but one puzzle near the end of the game was proving to be more challenging than I had intended. To this end, a minor clue has been added to this puzzle.



# A and D as left and right



In case you're allergic to your computer's left and right directional buttons, the game will now recognize the A and D keys for the same functions, respectively.



# Powered by HaxeFlixel



In case you didn't know, this game was made using the incredible [HaxeFlixel](http://www.haxeflixel.com) library. To show my thanks for this awesome tool, I've added a screen to the game's introduction.

[![update_12](http://www.steverichey.com/wp-content/uploads/2013/11/update_12.png)](http://www.steverichey.com/wp-content/uploads/2013/11/update_12.png)

Please note that this screen, and the screen with my information on it, will only show once each time the game is loaded.



# Better 32-bit support



Don't Move was developed in a 64-bit environment, which can make backwards compatibility a bit tricky. I've made some changes to the game which should improve the game's ability to run on older systems; please let me know if you encounter any errors!



# Code base improvements



A whole lot has been changed behind the scenes. Not only did I add all the stuff above, I completely re-visited my main game loop, and significantly reduced its complexity and general junkiness. This should result in a much smoother and consistent experience!



# Secret Secrets



Some of the game's secrets were a bit tedious to unlock, and confusing to boot.  Not only have I added new secrets, I've made the process of unlocking them MUCH quicker.  Good luck!

That's everything! Check out [Don't Move v1.1](http://www.desura.com/games/dont-move) on [Desura](http://www.desura.com/) November 22, 2013 and be sure to follow [@stvr_tweets](https://twitter.com/stvr_tweets) for further Don't Move news!
