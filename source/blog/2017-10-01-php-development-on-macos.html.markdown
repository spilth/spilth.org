---
title: PHP Development on macOS
---

I long time ago I did PHP development. Then I discovered Ruby on Rails and never, *ever* wanted to look back. This was around the time of Rails 2 which was 10 years ago!

There are still a lot of jobs out there for PHP developers and I became curious as to how much PHP has "matured" in the last several years.

Some of the things I like about Rails development are:

1. How easy Ruby is to install
2. How easy Rails is to install
3. How easy it is to start a Rails project
4. How easy it is to start a development server
5. How easy it is to define dependencies in a Ruby/Rails project
6. Easy management of development, test and production environments
7. All the nice libraries provided by Rails that make development easier
8. The testing support for Ruby/Rails (RSpec, for me)

Doing 1 through 5 is pretty straightforward for Rails development. You can have a basic Rails up and running in a few minutes. Is that possible with PHP?

I'm sure there are plenty of solutions using virtual machines, Docker, etc. but I wanted to go with something simple and familiar. I do a fair amount of development on a MacBook Air with the minimal amount of (soldered-on) RAM, so spinning up a VM isn't the best option for me.

*Note: I'm assuming that you're running macOS and you're using [Homebrew](https://brew.sh).*

## Ruby on Rails

Here are the steps for spinning up a minimal Ruby on Rails web application:

```bash
$ brew install rbenv
$ eval "$(rbenv init -)"
$ rbenv install 2.3.4
$ rbenv global 2.3.4
$ gem install bundler
$ gem install rails
$ rails new foo
$ rails server
```

Then visit <http://localhost:3000>!

## PHP (with Laravel)

Since Ruby has the Rails Framework to give it a leg up on web development it wouldn't be fair to compare it to *just* PHP the language. So, simple going by "what I've heard", [Laravel](https://laravel.com) might be the equivalent framework in PHP land.

According to Wikipedia:

> Laravel is a free, open-source PHP web framework, created by Taylor Otwell and intended for the development of web applications following the model–view–controller (MVC) architectural pattern.

After doing some digging (and a few false starts) I managed to get a basic Laravel web application up and running using the following steps:

```bash
$ brew tap homebrew/homebrew-php
$ brew install php72
$ export PATH="$(brew --prefix homebrew/php/php72)/bin:$PATH"
$ brew install composer
$ composer global require "laravel/installer"
$ export PATH="~/.composer/vendor/bin/:$PATH"
$ laravel new foo
$ cd foo
$ php artisan serve
```

Then visit <http://localhost:8000>!

## Conclusion

It works! You can install PHP on your Mac a lot more easily these days - it's essentially the same set of steps as the Rails app.

There's plenty more for me to explore (environments, databases, migrations, scaffolding, TDD) but for now I've sated my curiosity.

