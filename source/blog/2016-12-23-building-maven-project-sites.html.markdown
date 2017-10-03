---
title: Using Maven to Build a Web Site for Your Java Project
---

When creating a library for other developers to use it's a huge help to provide documentation on how to add the library to a project and use it.

Building a site from scratch can take time and energy you don't have, but if you're using Maven that time and energy can be minimized by using the built-in `site` lifecycle.

READMORE

In this tutorial we will:

- use the `site` lifecycle to build a web site for a Java project
- try out a couple of different "skins" for the web site
- create a custom About page to describe how to include and use the library
- generate JavaDocs as part of the web site

## Initializing a Maven Project

If you don't already have a project that you need to build a site for you can use Maven to quickly initialize a new project and try it out.

```bash
$ mvn archetype:generate -DgroupId=org.spilth -DartifactId=test -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
$ cd test
```

## Building a Maven Project's Site

To build a site for your Maven project, use the `site` command. The site will be generated under `target/site`.

```bash
$ mvn site
$ open target/site/index.html
```

It's pretty bare bones but it's a start!

## Dealing with Warnings

You may have noticed some warnings in the output from the `mvn site` command:

```bash
[WARNING] Report plugin org.apache.maven.plugins:maven-project-info-reports-plugin has an empty version.
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
```

This is easy to fix. Add a `<reporting>` section to your project's `pom.xml` and set the version for the `maven-project-info-reports` plugin to `2.9`, the latest.

```xml
<reporting>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-project-info-reports-plugin</artifactId>
      <version>2.9</version>
    </plugin>
  </plugins>
</reporting>
```

Regenerate the site using `mvn site` and the warnings should be gone.

## Adding a Project Description

Currently there's some placeholder text for the description of the project. You can fill this in by adding a `<description>` element to your `pom.xml`:

```xml
<project>
  ...
  <name>test</name>
  <url>http://spilth.org/test</url>
  <description>Put the project description here</description>
  ...
</project>
```

Regenerate your project's site and confirm the description shows up.

There are a number of additional elements you can add to your `pom.xml` that will be turned into site information. Check out [More Project Information](https://maven.apache.org/pom.html#More_Project_Information) in the [POM Reference](https://maven.apache.org/pom.html) to see all the information you can provide.

## Using the Fluido Skin

The default skin gets the job done but we can make things look a little nicer using the [Maven Fluido Skin](https://maven.apache.org/skins/maven-fluido-skin/). All you need to do is create the file `src/site/site.xml` with the following contents:

```xml
<project name="test">
  <skin>
    <groupId>org.apache.maven.skins</groupId>
    <artifactId>maven-fluido-skin</artifactId>
    <version>1.5</version>
  </skin>
</project>
```

*I am specifically using the version 1.5 instead of the latest 1.6 because of an error it generates.*

Regenerate the site and you'll see something a bit more pleasing than the default Maven generated site.

## Using the Reflow Skin

Fluido is based on Bootstrap 2 but there's another skin based on Bootstrap 3 (that requires just a bit more configuration) called [Reflow Maven Skin](http://andriusvelykis.github.io/reflow-maven-skin/).

First, change your `src/site/site.xml` to have the following contents:

```xml
<project name="test">
  <skin>
    <groupId>lt.velykis.maven.skins</groupId>
    <artifactId>reflow-maven-skin</artifactId>
    <version>1.1.1</version>
  </skin>
  <body>
    <menu ref="reports"/>
  </body>
</project>
```

Then update the `<build>` section of your `pom.xml` to add two dependencies required by Reflow to the `maven-site` plugin.

```xml
<build>
  <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-site-plugin</artifactId>
      <version>3.3</version>
      <dependencies>
        <dependency>
          <groupId>lt.velykis.maven.skins</groupId>
          <artifactId>reflow-velocity-tools</artifactId>
          <version>1.1.1</version>
        </dependency>
        <dependency>
          <groupId>org.apache.velocity</groupId>
          <artifactId>velocity</artifactId>
          <version>1.7</version>
        </dependency>
      </dependencies>
    </plugin>
  </plugins>
</build>
```

Regenerate the site and you'll see a much more impressive looking site.

Reflow allows for a bunch of customization and options, so be sure to check out the [Reflow configuration documentation](http://andriusvelykis.github.io/reflow-maven-skin/skin/config.html).

## Creating a Custom Index Page

Normally a Java project would now point you to its JavaDocs to learn how to use it but we can do better than that -  showing users how to add and use your library will help them realize just how easy it is to use.

To accomplish this we'll create a custom "About" page for the project. There are a few different markup languages you can use to do this but I highly recommend using [Markdown](https://daringfireball.net/projects/markdown/).

Create the file `src/site/markdown/index.md` and add some helpful introductory information. For a short example check out [the index page for my piglib Java library](https://raw.githubusercontent.com/spilth/piglib/master/src/site/markdown/index.md).


Regenerate your site and you should see your new about page as the default.

## Generating JavaDocs as Part of the Site

The About page can take a developer only so far. At some point they need to know the classes and methods that your library provides.

Add the following to the `<reporting>` section of your `pom.xml` and regenerate the site.

```xml
<plugin>
  <groupId>org.apache.maven.plugins</groupId>
  <artifactId>maven-javadoc-plugin</artifactId>
  <version>2.10.4</version>
</plugin>
```

Now the dropdown menu should include a `Project Reports` link with a `JavaDocs` link under it. Click on that and you'll see your project's JavaDocs.

## Fixing JavaDocs Warnings

You may have once again noticed a warning from Maven when generating the JavaDocs. In fact, it shows up a few times:

```bash
[WARNING] Source files encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
```

This is another easy fix. In your `pom.xml` add the following property:

```xml
<properties>
    <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
</properties>
```

Now when you regenerate the site you shouldn't see any warnings. If you do, they're likely regarding the JavaDocs for your classes and methods.

## Improving your Project's JavaDocs

Now is a good time to go through your project and make sure your classes have decent JavaDocs provided. At a minimum you want to give each class and method a description. Describing arguments, return values and throw exceptions will also help your users.

## Publishing your Site

Once you're happy with your About page and JavaDocs, it's time to make your site public. I recommend using [Codeship](https://codeship.com/)'s Deployment feature to push the contents of `target/site` to an Amazon S3 Bucket.


