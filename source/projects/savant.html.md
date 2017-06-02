---
title: savant
---

savant is a command-line tool that attempts to make easier to:

- search Maven Central for Maven and Gradle dependencies
- initialize modern Java Maven projects

## Installation

You can install Savant using [Homebrew](http://brew.sh/):

```bash
$ brew tap spilth/tap
$ brew install savant
```

## Usage

### Search Maven Central

To search Maven Central for Maven dependency coordinates:

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

### Initialize Maven Project

You can also use Savant to quickly initialize a new Maven project.

#### With Defaults

```bash
$ savant init
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] >>> maven-archetype-plugin:2.4:generate (default-cli) > generate-sources @ standalone-pom >>>
[INFO]
[INFO] <<< maven-archetype-plugin:2.4:generate (default-cli) < generate-sources @ standalone-pom <<<
[INFO]
[INFO] --- maven-archetype-plugin:2.4:generate (default-cli) @ standalone-pom ---
[INFO] Generating project in Batch mode
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Old (1.x) Archetype: maven-archetype-quickstart:1.0
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: basedir, Value: /Users/brian/temp
[INFO] Parameter: package, Value: com.example
[INFO] Parameter: groupId, Value: com.example
[INFO] Parameter: artifactId, Value: exampleArtifact
[INFO] Parameter: packageName, Value: com.example
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] project created from Old (1.x) Archetype in dir: /Users/brian/temp/exampleArtifact
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.988 s
[INFO] Finished at: 2016-12-11T18:11:01-05:00
[INFO] Final Memory: 14M/152M
[INFO] ------------------------------------------------------------------------
```

#### Additional Initialization Options

You can specify your Group and Artifact IDs with the `--groupId` and `--artifactId` command-line options, also available as `-g` and `-a`.

You can also specify using a minimal Java 8 archetype using the `--minimal` command-line option, also available as `-m`.

```bash
$ savant init --groupId spilth.org --artifactId foo --minimal
[INFO] Scanning for projects...
[INFO]
[INFO] ------------------------------------------------------------------------
[INFO] Building Maven Stub Project (No POM) 1
[INFO] ------------------------------------------------------------------------
[INFO]
[INFO] >>> maven-archetype-plugin:2.4:generate (default-cli) > generate-sources @ standalone-pom >>>
[INFO]
[INFO] <<< maven-archetype-plugin:2.4:generate (default-cli) < generate-sources @ standalone-pom <<<
[INFO]
[INFO] --- maven-archetype-plugin:2.4:generate (default-cli) @ standalone-pom ---
[INFO] Generating project in Batch mode
[INFO] ----------------------------------------------------------------------------
[INFO] Using following parameters for creating project from Old (1.x) Archetype: maven-archetype-quickstart:1.0
[INFO] ----------------------------------------------------------------------------
[INFO] Parameter: basedir, Value: /Users/brian/temp
[INFO] Parameter: package, Value: spilth.org
[INFO] Parameter: groupId, Value: spilth.org
[INFO] Parameter: artifactId, Value: foo
[INFO] Parameter: packageName, Value: spilth.org
[INFO] Parameter: version, Value: 1.0-SNAPSHOT
[INFO] project created from Old (1.x) Archetype in dir: /Users/brian/temp/foo
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 3.453 s
[INFO] Finished at: 2016-12-11T18:07:41-05:00
[INFO] Final Memory: 14M/153M
[INFO] ------------------------------------------------------------------------
```

## Resources

- [savant Source](https://github.com/spilth/savant)
- [java8-junit4-quickstart Archetype Source](https://github.com/spilth/java8-junit4-quickstart)
- [java8-minimal-quickstart Archetype Source](https://github.com/spilth/java8-minimal-quickstart)

