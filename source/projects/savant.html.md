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

To quickly initialize a new Maven project use the `init` command:

```bash
$ savant init
Creating project 'exampleArtifact'...
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
[INFO] Parameter: artifactId, Value: exampleArtifact
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: packageInPathFormat, Value: com/example
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: artifactId, Value: exampleArtifact
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Project created from Archetype in dir: /Users/brian/temp/exampleArtifact
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.453 s
[INFO] Finished at: 2017-11-05T12:55:09-05:00
[INFO] Final Memory: 15M/52M
[INFO] ------------------------------------------------------------------------
Project created in directory exampleArtifact
```

#### Languages

Savant can create `java` (Java 9, default), `java8` or `kotlin` projects.

You can specify the Language with the `--language` command-line option, also available as `-l`,

```bash
$ savant init -l kotlin
Creating project 'exampleArtifact'...
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
[INFO] Parameter: artifactId, Value: exampleArtifact
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: packageInPathFormat, Value: com/example
[INFO] Parameter: kotlinVersion, Value: 1.1.51
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: artifactId, Value: exampleArtifact
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] Project created from Archetype in dir: /Users/brian/temp/exampleArtifact
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.453 s
[INFO] Finished at: 2017-11-05T13:10:09-05:00
[INFO] Final Memory: 15M/52M
[INFO] ------------------------------------------------------------------------
Project created in directory exampleArtifact
```

#### Group and Artifact IDs

By default Savant uses the Group ID `com.example` and the Artifact ID `exampleArtifact`

You can specify your own Group and Artifact IDs with the `--groupId` and `--artifactId` command-line options, also available as `-g` and `-a`.

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

To get Gradle coordinates instead, pass `--format gradle` to the search command:

```bash
$ savant search cucumber-junit --format gradle
compile group: 'com.github.mkolisnyk', name: 'aerial-maven-cucumber-junit-archetype', version: '0.0.6.1'
compile group: 'com.github.mkolisnyk', name: 'aerial-cucumber-junit-archetype', version: '0.0.6.1'
compile group: 'info.cukes', name: 'cucumber-junit', version: '1.2.5'
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

