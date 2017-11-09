---
title: savant
---

savant is a command-line tool that makes easier to:

- Initialize modern Java & Kotlin Maven projects
- Search Maven Central for Maven and Gradle dependencies
- Add the JavaDocs for your Maven project dependencies to [Dash](https://kapeli.com/dash)

## Installation

You can install Savant using [Homebrew](http://brew.sh/):

```bash
$ brew tap spilth/tap
$ brew install savant
```

## Usage

### Initialize a Maven Project

To quickly initialize a new Maven project use the `init` command. Pass it the name of your project and the language you'd like to use:

```bash
$ savant init hellojava --language java
Creating project 'hellojava'...
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] >>> maven-archetype-plugin:3.0.1:generate (default-cli) > generate-sources @ standalone-pom >>>
[INFO]
[INFO] <<< maven-archetype-plugin:3.0.1:generate (default-cli) < generate-sources @ standalone-pom <<<
[INFO]
[INFO]
[INFO] --- maven-archetype-plugin:3.0.1:generate (default-cli) @ standalone-pom ---
[INFO] Generating project in Batch mode
[WARNING] Archetype not found in any catalog. Falling back to central repository.
[WARNING] Add a repsoitory with id 'archetype' in your settings.xml if archetype's repository is elsewhere.
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Archetype: java9-minimal-quickstart:1.0.0
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: artifactId, Value: hellojava
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: packageInPathFormat, Value: com/example
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: artifactId, Value: hellojava
[INFO] Project created from Archetype in dir: /Users/brian/temp/hellojava
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 4.687 s
[INFO] Finished at: 2017-11-09T14:03:09-05:00
[INFO] Final Memory: 15M/153M
[INFO] ------------------------------------------------------------------------

Project created in directory hellojava
```

#### Languages

Savant can create `java` (Java 9, default), `java8` or `kotlin` projects.

You specify the Language with the `--language` command-line option, also available as `-l`,

```bash
$ savant init hellokotlin -l kotlin
Creating project 'hellokotlin'...
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] >>> maven-archetype-plugin:3.0.1:generate (default-cli) > generate-sources @ standalone-pom >>>
[INFO]
[INFO] <<< maven-archetype-plugin:3.0.1:generate (default-cli) < generate-sources @ standalone-pom <<<
[INFO]
[INFO]
[INFO] --- maven-archetype-plugin:3.0.1:generate (default-cli) @ standalone-pom ---
[INFO] Generating project in Batch mode
[INFO] Archetype repository not defined. Using the one from [org.jetbrains.kotlin:kotlin-archetype-jvm:1.1.51] found in catalog remote
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Archetype: kotlin-archetype-jvm:1.1.51
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: artifactId, Value: hellokotlin
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: packageInPathFormat, Value: com/example
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: kotlinVersion, Value: 1.1.51
[INFO] Parameter: artifactId, Value: hellokotlin
[INFO] Project created from Archetype in dir: /Users/brian/temp/hellokotlin
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 5.808 s
[INFO] Finished at: 2017-11-09T14:05:32-05:00
[INFO] Final Memory: 15M/151M
[INFO] ------------------------------------------------------------------------

Project created in directory hellokotlin
```

#### Group ID

By default Savant uses the Group ID `com.example`.

You can specify your own Group with the `--groupId` command-line option, also available as `-g`.

### Search Maven Central

To search Maven Central for Maven dependency coordinates use the `search` command followed by the artifact you're looking for:

```bash
$ savant search hamcrest-core
<dependency>
    <groupId>org.hamcrest</groupId>
    <artifactId>hamcrest-core</artifactId>
    <version>1.3</version>
</dependency>
<dependency>
    <groupId>org.ops4j.pax.tipi</groupId>
    <artifactId>org.ops4j.pax.tipi.hamcrest.core</artifactId>
    <version>1.3.0.1</version>
</dependency>
```

#### Gradle Coordinates

To get Gradle coordinates instead, pass `--format gradle` to the search command, also available as `-f`:

```bash
$ savant search hamcrest-core --format gradle
compile group: 'org.hamcrest', name: 'hamcrest-core', version: '1.3'
compile group: 'org.ops4j.pax.tipi', name: 'org.ops4j.pax.tipi.hamcrest.core', version: '1.3.0.1'
```

### Add Project Dependency JavaDocs to Dash

You can add the JavaDocs for your Maven project's dependencies to [Dash](https://kapeli.com/dash) using the `dash` command:

```bash
$ savant dash
Requesting docs for org.apache.httpcomponents:httpcore:4.4.5
Requesting docs for org.apache.httpcomponents:httpclient:4.5.2
Requesting docs for com.fasterxml.jackson.core:jackson-databind:2.5.3
Requesting docs for com.beust:jcommander:1.58
Requesting docs for org.apache.maven:maven-model:3.5.0
```

By default the command looks for a `pom.xml` in the current directory. To point to a POM file elsewhere or one with a different name use the `--pom` or `-p` option.

```bash
$ savant dash -p ~/Dropbox/Projects/setlib/pom.xml
Requesting docs for org.hamcrest:hamcrest-all:1.1
Requesting docs for junit:junit:4.8.2
Requesting docs for org.slf4j:slf4j-simple:1.6.1
Requesting docs for org.slf4j:slf4j-api:1.6.1
```

## Resources

- [savant Source](https://github.com/spilth/savant)
- [java9-minimal-quickstart Archetype Source](https://github.com/spilth/java9-minimal-quickstart)
- [java8-minimal-quickstart Archetype Source](https://github.com/spilth/java8-minimal-quickstart)
- [Dash](https://kapeli.com/dash) - an API Documentation Browser and Code Snippet Manager

