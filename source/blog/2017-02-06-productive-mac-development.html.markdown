---
title: Productive Mac Development for New Developers
---

If you're new to the world of software development you are probably focused on learning a specific language, framework or tech stack. But another important skill for developers is being a *productive* developer. This means working with speed and ease.

Fortunately there are a number of shortcuts, tools and techniques on the Mac that you can use to improve your productivity.

## Navigating Applications

### Start Applications Quickly

There are a few ways to start applications on your computer such as the Dock, Launchpad or Finder, but I'm going to show you the quickest way:

- Hold down the Command key (⌘) and tap the space bar
- The `Spotlight Search` window pops up
- Start typing the name of application you want to start, for example `System Preferences`
- By the time you get to `sys`, Spotlight has probably already  autocompleted `System Preferences` for you
- Press enter
- The `System Preferences` window should open up

![](../images/blog/spotlight.png)

This is *much* faster than using the other methods listed above and we'll be using this technique moving forward.

If you decide you don't actually want to start another application just tap the `esc` key (twice if you started typing something) and the Spotlight window will go away.

### Switch Applications Quickly

While you can certainly use the Dock to switch applications, there's a keyboard shortcut we can use to achieve the same thing without having to grab our mouse or locate the pointer.

- Hold down the Command key (⌘) and tap the Tab key repeatedly
- This will take you through your open Apps
- When you let go of the Command key you'll switch to the hightlighted app
- You can also hold down Shift to go backwards through your open apps
- If you decide that you don't actually want to switch applications, tap the `esc` key instead of the `tab` key.

### Quit Applications Quickly

To quickly close the active application (such as the `System Properties` we just opened), hold down the Command key (⌘) and tap `Q`.

## Taking Control of Your Mac

### Ensure you have Admin Rights

Let's make sure you have the ability to administer your computer. You will need this ability to install certain programs and run certain commands.

- Use Spotlight (Command and Space) to start up `Users & Groups`
- Select your name/account from the list on the left
- Ensure `Allow user to administer this computer` is checked

![](../images/blog/users-and-groups.png)

If the checkbox is unchecked and grayed out then look at the list of names on the left side and see if anybody has `Admin` under their name. You'll need to ask them to give you Admin rights on your (their?) computer.

### Clean Up Your Login Items

While you still have `Users & Groups` open (use Spotlight again if you already closed it) lets remove any applications you don't need to have running every time you start your Mac.

- Click the the `Login Items` tab and
- Click on the application you want to remove
- Click on the `-` button underneath the list of applications to prevent the selected application from starting every time you log in

Examples of Applications you likely want to remove are:

- `iTunesHelper`
- `CleanMyMac`
- `Skype`
- `GrowlHelperApp`
- `Steam`
- Most Helper, Notification or Launche apps

### Ensure you have an App Store Account

Next we want to make sure you have an App Store account. You'll need this to upgrade macOS and install XCode, which we'll be doing in a little bit:

- Use Spotlight to start `App Store`
- Click on the `Store` menu
- Click on `View my Account...`
- It should prompt you for your password to sign in

### Ensure your Operating System is up to date

It's time to make sure you have the latest version of macOS installed.

*Warning: You should do the usual OS upgrade stuff like making sure you have a backup of your machine first!*

[Download macOS Sierra](https://itunes.apple.com/us/app/macos-sierra/id1127487414?mt=12) from the App Store and upgrade your computer.

### Restart Your Computer

If you upgraded macOS then you've most definitely restarted your computer. If not, now would be a good time to do that.

Restarting your computer will ensure that all programs are shut down and you're starting fresh with nothing already running, such as the `Login Items` we removed earlier.

- Click on the  in the upper left of your screen
- Click on `Restart...`
- Click the `Restart` button in the confirmation dialog

Once the machine restarts you should log in and have nothing running.

## XCode

XCode is an Integrated Development Environment (IDE) used for building macOS, iOS, watchOS and tvOS apps. Even if you're not  planning to build apps for any of those platforms many other development tools rely on having XCode installed, so we should make sure you have the latest version installed.

### Install XCode

[Download XCode from the App Store](https://itunes.apple.com/us/app/xcode/id497799835) and install it on your computer.

### Agree to the XCode License

Now we need to agree to XCode License so that we can use the tools it provides:

- Start `Terminal` using Spotlight
- In the Terminal window that pops up, type `sudo xcodebuild -license`
- It will ask for your password (the one you log into your computer with)
- Press `q` to jump to the end of the license
- Type `agree` and press return to agree to the license

#### What is sudo?

`sudo` is a command that lets you run commands as another user. By default that user is `root` which has access too all commands, directories and files on your computer. *You should only have to use `sudo` very infrequently.*

## Use a Package Manager

While you are developing software you will likely need to install a number of additional packages and you want to be able to do that quickly with a minimum amount of button clicking and question answering - ideally none!

Packages can be:

- **Applications** such as Spotify, Sublime Text or Slack
- **Services** such as MySQL, Apache or Elasticsearch
- **Languages** such as Ruby, Python or Node
- **Command-Line Tools** such as ImageMagick, Maven or Grunt

[Homebrew](http://brew.sh) is a Package Manager you can use to install, update and manage packages on a Mac.

### Install Homebrew

To install Homebrew:

- Start `Terminal` using Spotlight
- Select, copy (Command + C) and paste (Command + V) the following into your Terminal window:

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Once that completes you should have access to the `brew` command in Termal.

We'll be using Homebrew in just a little bit to install a few applications and tools.

#### Keeping Homebrew Happy

It's a good idea to run the following commands occassionally to keep Homebrew healthy and lean:

- `brew update` to keep Homebrew up to date.
- `brew doctor` to keep Homebrew healthy. *This may give you some information to act on, which you probably should.*
- `brew cleanup` to keep Homebrew slim by uninstalling old versions of packages.

## Using a Better Terminal Application

As you grow as a developer you will likely find yourself using the computer at a lower level than you have previously - you'll be typing commands in a terminal window instead of clicking on windows, tabs and buttons.

An example of this is when you agreed to the XCode license and installed Homebrew above. This could have been done with XCode but it would've take much more clicking and waiting to accomplish.

And while Terminal certainly got the job done, we can do better. [iTerm 2](https://www.iterm2.com/) is an arguably improved version of Terminal. At a minimum it looks much nicer than Terminal.

### Install iTerm 2

We can install iTerm 2 using Homebrew:

- In your Terminal window type `brew cask install iterm2`

Wasn't that easier than:

- going to the iTerm website
- finding the download link
- waiting for the file to download
- finding the downloaded file
- double-clicking the downloaded file
- starting the installer
- clicking `Next` multiple times
- finally clicking `Finish`

When iTerm is done installing:

- quit Terminal using Command + `Q`
- use Spotlight to start `iTerm 2`

#### What is a Cask?

Homebrew uses a number terms inspired by the practice of brewing. In this case Cask is a special command you use specifically to install desktop (GUI) applications as opposed to command-line applications.

## Make the Most of your Screen Real Estate

[ShiftIt](https://github.com/fikovnik/ShiftIt) is a tool that lets you easily resize the current application's window using the keyboard instead of the mouse.

For example: you can use it to set up your HTML editor on the left side of the screen and web browser on the right side of the screen without having to fuss with the mouse and trying to line things up perfectly

### Install ShiftIt

You can install it using Homebrew:

```sh
brew cask install shiftit
```

Then use Spotlight to start ShiftIt. It will likely inform you that it needs some permissions to control your machine.

### Giving ShiftIt Permissions

ShiftIt needs permission to control your computer. Let's give it that permission.

1. Use Spotlight to open your `Security & Privacy` preferences.
1. Select the `Privacy` tab.
1. In the left sidebar choose `Accessibility`.
1. Click the lock in the lower left corner to make changes and enter your password.
1. In the right-hand pane titled `Allow the apps below to control your computer` check the box next to `ShiftIt`.
1. Quit your `Security & Privacy` preferences.
1. Start ShiftIt again using Spotlight.

### Using ShiftIt

You use ShiftIt by holding down Control, Option and Command at the same time and then pressing:

- The left arrow to move the current window the left half of your screen.
- The right arrow to move the current window the right half of your screen.
- `M` to maximize the current window.
- `C` to center the current window.
- `F` to full screen the current application.

### Automatically Hide the Dock

To get some more screen real estate for your apps you can set the Dock to automatically hide when your mouse isn't near it:

- Hold down the Command and Option keys and then tap `D`.

This will hide the Dock if it isn't already hidden. Now when you maximize a window using ShiftIt, it will fill the entire screen.

### Automatically Hide the Menu Bar

To get *even more* screen real estate you can also hide the menubar if you're running the latest version of macOS.

- Use Spotlight to start the `General` preferences window
- Check the checkbox next to `Automatically hide and show menu bar`2

### Be Kind to Your Eyes

Finally, while we're on the topic of the screen, there's a nice menu bar app called [f.lux](https://justgetflux.com) that will adjust the white point of your screen based on the time of day. This results in less harsh light pelting your eyes late in the evening.

```bash
$ brew cask install flux
```

Then start `flux` using Spotlight. You'll find f.lux in your menu bar where you can adjust its preferences to your liking.
