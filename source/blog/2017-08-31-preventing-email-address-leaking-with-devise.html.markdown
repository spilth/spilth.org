---
title: Preventing Email Address Leaking with Devise
---

When using [Devise](https://github.com/plataformatec/devise) in a Ruby on Rails application if a user tries to sign up for an account using an email address that's already being used the site lets you know with an error message `Email Address has already been taken`.

This means somebody could try to sign up with your email address to see if you have an account on the site. If the web site is about a sensitive subject then your users may not want other people poking around to see if they have an account on it.

READMORE

In order to prevent Devise from divulging this information we need to do a few things:

1. Enable Devise's `confirmable` functionality
1. Act like the email address doesn't already exist when registering an account
1. Don't let the user know if the email address exists when asking to resend confirmation instructions
1. Don't let the user know if the email address exists when asking to send password reset instructions

Since the person can't read your email (if they can you have bigger problems!) they won't know wether or not you got the *potential* confirmation email or password reset email.

## Enabling Confirmable

If your User model doesn't already have `confirmable` you should follow [How To: Add :confirmable to Users](https://github.com/plataformatec/devise/wiki/How-To:-Add-:confirmable-to-Users) before continuing. This forces new users to confirm their email address before being able to use their account.

## Enabling Paranoid Mode

For items 3 & 4 we can enable Devise's `paranoid` mode. In `config/initializers/devise.rb` look for and uncomment the following line:

```ruby
# It will change confirmation, password recovery and other workflows
# to behave the same regardless if the e-mail provided was right or wrong.
# Does not affect registerable.
config.paranoid = true
```

Now Devise will show the message `If your email address exists in our database...` when you submit these two forms.

## Altering Registration Behavior

When registering a new account Devise will let you know when an email address is already taken, which lets you know the person with that email address probably has an account on the site.

We're going to change the process to act like the email address doesn't already exist and as if a confirmation email has been sent.

We do this by adding an `after_validation` hook that checks to see if the `email already taken` is the one and only validation error.

- If it is the only validation error we raise a custom `EmailTaken` error that our `ApplicationController` will handle
- If it isn't the only validation error we remove it and let the potential user see the rest of their validation errors

In `app/models/user.rb` add the following:

```ruby
class User < ApplicationRecord
  class EmailTaken < StandardError;end
  
  after_validation :check_for_email_taken
  
  private

  def check_for_email_taken
    return unless errors.details.key?(:email)

    raise EmailTaken if only_email_errors? && only_email_taken_errors?

    scrub_email_taken_errors
  end

  def only_email_errors?
    errors.details.keys == [:email]
  end

  def only_email_taken_errors?
    errors.details[:email].collect { |detail| detail[:error] }.uniq == [:taken]
  end

  def scrub_email_taken_errors
    errors.details[:email].reject! {|detail| detail[:error] == :taken}
    errors.details.delete(:email) if errors.details[:email].empty?

    errors.messages[:email].reject! {|message| message == 'has already been taken'}
    errors.messages.delete(:email) if errors.messages[:email].empty?
  end
end
```

Then in `app/controllers/application_controller.rb` we add the following:

```ruby
class ApplicationController < ActionController::Base
  rescue_from User::EmailTaken do |_exception|
    redirect_to root_path, notice: t('devise.registrations.signed_up_but_unconfirmed')
  end
end
```

Here we are redirecting to the root path and showing the same flash notice message we would have shown if they account had been created for real.

## Feedback

See a scenario that I missed or have a nice refactoring to the code above? Please let me know by leaving a comment!

