---
title: Java Development on macOS
---

Back in the day I used to be a Windows guy, but when Vista came out I decided to jump ship and switch to Mac/OS X. I haven't looked back since.

With the ability to run Windows and Linux on a Mac (either via VirtualBox or Boot Camp), I find I can do all I need on a Mac.  This includes Java development which I would argue is *much* easier to install and manage on macOS than on a Windows box.

READMORE

Here are some of the tools I use for Java development on the Mac.

## Package Management

[Homebrew](http://brew.sh) is a package manager that lets you easily install command-line tools, applications and services on your Mac. This is one of the first things I install on any macOS machine. We'll be using it to install everything else in this guide.

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### Homebrew Maintenance

I occasionally run the following commands to make sure my Homebrew installation is healthy and up to date.

```bash
$ brew update
$ brew doctor
$ brew upgrade
$ brew cleanup
```

## Java Development Kit

We can't really do Java development without the JDK installed, so let's use Homebrew to do it.

```bash
$ brew cask install java
```

Could that be any easier? No license agreements. No installation wizards with multiple `Next` buttons. No `PATH` variables to edit. Just one command. Done.

## Build Tools

It's helpful to have two of the most popular Java build tools installed:

```
$ brew install maven
$ brew install gradle
```

## Integrated Development Environment

I highly recommend [IntelliJ IDEA](https://www.jetbrains.com/idea/) as an IDE for Java development.

```bash
$ brew cask install intellij-idea
```

## Version Control

Since we're modern developers we use [Git](https://git-scm.com), and it's important to ensure we have the latest version installed.

I also recommend [SourceTree](https://www.sourcetreeapp.com) if you prefer a graphical Git interface.

```bash
$ brew install git
$ brew cask install sourcetree
```

## Shell Tools

[bash-it](https://github.com/Bash-it/bash-it)
 is a collection of bash scripts that provide a number of helpful aliases, completions and plugins for Java developers.

First we need to install bash-it:

```bash
$ git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
$ ~/.bash_it/install.sh
```

### Enable Relevant Aliases, Completion, Plugin

Now it's time to enable a bunch of helpful aliases, completions and plugins:

```bash
$ bash-it enable alias git
$ bash-it enable alias maven
$ bash-it enable completion brew
$ bash-it enable completion git
$ bash-it enable completion gradle
$ bash-it enable completion maven
$ bash-it enable plugin git
$ bash-it enable plugin java
```

## JavaDocs

Finally, finding and reading JavaDocs can be quite a pain. Google searches don't always lead you to the latest version of the docs. Fortunately Dash makes it easy to get all the latest JavaDocs into one easy and consistent UI.

```bash
$ brew cask install dash
```

