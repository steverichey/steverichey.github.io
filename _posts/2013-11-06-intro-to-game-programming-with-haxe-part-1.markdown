---
author: admin
comments: true
date: 2013-11-06 00:28:08+00:00
excerpt: Basic information on Haxe, OpenFL, HaxeFlixel, and FlashDevelop.
layout: post
slug: intro-to-game-programming-with-haxe-part-1
title: 'Intro to Game Programming with Haxe: Part 1'
wordpress_id: 1667
categories:
- Development
tags:
- actionscript
- adobe
- code
- coding
- development
- gamedev
- games
- haxe
- haxeflixel
- nme
- openfl
- programming
---

In this series, I'll be discussing how to go from near-zero coding knowledge to being able to write simple games using Haxe, OpenFL and HaxeFlixel, using FlashDevelop.  This post will introduce these elements and why I think they're an excellent choice for a novice developer.



# Why Haxe?



[Haxe](http://haxe.org/) is the open-source sister to [Adobe](http://www.adobe.com/)'s [ActionScript](http://www.adobe.com/devnet/actionscript.html), which is the programming language you'd usually use for making games in [Flash](http://en.wikipedia.org/wiki/Adobe_Flash_Player).  Since Haxe and ActionScript are both based on the same standard as dictated by [ECMA International](http://www.ecma-international.org/) (an electronics industry standards association) the [syntax](http://en.wikipedia.org/wiki/Syntax_(programming_languages)), or the way the language is written, is [very similar](http://haxe.org/doc/start/flash/as3migration/part1).

Much like ActionScript, Haxe is fairly easy to program in; the language is [strongly typed](http://en.wikipedia.org/wiki/Strong_and_weak_typing), meaning that many coding errors will be caught before your program even runs.  Since you can target Flash, you get the benefit of an easy-to-use publishing platform (just about anyone will be able to play your game in their desktop browser) and quick compilation, meaning that you can test new code quickly and easily.  Unlike ActionScript, Haxe is totally [open source](https://github.com/HaxeFoundation/haxe/), [free](http://haxe.org/doc/license), and maintained by the [Haxe Foundation](http://haxe-foundation.org/).  If you'd like to give Haxe a shot before committing to too much, you can do so [here](http://try.haxe.org/), although that's based on a previous version.

While the term "Flash game" typically has a derogatory connotation, the fact is that Flash is a pretty powerful platform for games today.  There are some long-term viability issues, however, as many mobile devices simply do not support Flash.  Luckily, Haxe can help with that.  In addition to targeting Flash, Haxe can create applications for Windows, Linux, Mac, iOS, Android, and HTML5.  Things can get complicated when you're targeting multiple platforms -- more on that in a future installment -- but with some effort you can have one code base for a huge variety of deployments.



# What is OpenFL?



[OpenFL](http://www.openfl.org/), formerly [NME](http://en.wikipedia.org/wiki/NME_(framework)), is simply a Haxe [library](http://en.wikipedia.org/wiki/Library_(computing)), or a bunch of code that you can use for your own purposes. Like Haxe itself, OpenFL is [open source](https://github.com/openfl/) (although some [bonus features](http://www.openfl.org/marketplace/premium/) are available to [paying members](http://www.openfl.org/company/blog/2013/10/16/introducing-openfl-member-accounts/)).  Specifically, OpenFL is a port of the Flash library to Haxe, meaning that you can access Flash-specific elements like sprites, bitmaps, and even movieclips without having to worry about the underlying code much.  Of course, if you want to, you can always dive into the code yourself and see how it all works!



# What is HaxeFlixel?



Making Flash games is pretty easy, but if you want to do more complicated stuff like generating levels from tilemaps, you'd have to write a lot of complex code on your own.  Luckily, [Flixel](http://www.flixel.org/) by [Adam Atomic](http://www.adamatomic.com/) (who has made such great games as [Canabalt](http://adamatomic.com/canabalt/)) is an ActionScript library full of useful code that makes getting started with game development even easier.  Of course, that won't help us on Haxe! Enter the amazing [HaxeFlixel](http://www.haxeflixel.com/) team, who have ported all of Flixel's functionality to Haxe.

HaxeFlixel will handle complicated things like state switching, collisions, particles, saving and loading, and level generation with ease.  It's commonly used to create old-school style games like platformers, but you can use it for just about anything!  HaxeFlixel uses OpenFL, and the two tie together nicely.



# What is FlashDevelop?



All of the above are great, but they won't do you any good if you don't know how to go from code to working game.  You can, of course, write code in a text editor like [Notepad++](http://notepad-plus-plus.org/), but this can be a bit daunting for early developers.  Instead, an Integrated Development Environment (IDE) can handle things like compiling, running the application after compilation, syntax highlighting, version control, management of assets related to the project, and so on.  For this, I recommend [FlashDevelop](http://www.flashdevelop.org/) for Windows.  Unfortunately, FlashDevelop is not available for Mac or Linux, but it seems like the favored alternative is [Sublime Text](http://www.sublimetext.com/).  I haven't worked much with the latter, and this tutorial will assume you're using the former, so keep that in mind.

FlashDevelop can create Haxe projects easily, but we'll find that HaxeFlixel's integration with FlashDevelop will be a huge boon when you're looking to jump into coding.  Furthermore, like everything else I've recommended, FlashDevelop is [open source](https://github.com/fdorg/flashdevelop) and totally free.

That's all for this time! In the next post, I'll actually tell you how to get your hands dirty and install everything you'll need to get running.  Feel free to let me know what you thought of this introduction, or what you'd like to see in future installments!
