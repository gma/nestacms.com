Date: 21:41 11 April 2024
Summary: Nesta 0.16.0 has been released.
Link text: Nesta 0.16.0 released

# Nesta 0.16.0 released (GA4 and Sinatra 3.1)

Nesta 0.16.0 is out. The most noteworthy change is the move from
Google's Universal Analytics to Google Analytics 4.

Here's a summary of the changes, taken from the [CHANGELOG file][]:

- Update Google Analytics JS code to GA4.

- Upgrade Sinatra to version 3.1.

- Tilt renderers (e.g. for Markdown, Haml, or Textile) are now configurable. See [this commit](https://github.com/gma/nesta/commit/c085d175) for details.

- Drop support for Ruby 2.7, which is no longer supported by Nokogiri, which is one of Nesta's dependencies. This is understandable; Ruby 2.7 reached end-of-life in March 2023.

- Bug fix: Config variables that were defined for an environment (test, dev, production), but for which there was no default, were always read as nil.


## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

If you're not using Google Analytics, you've no code changes to make.

If you are using Google Analytics, there are two common scenarios:

- If you copied Nesta's default `analytics.haml` template into your `./views` directory, you can upgrade your site to GA4 by replacing its contents with [the new template][].

- If you don't have an `analytics.haml` in your `./views` folder (but your site is rendering it as part of your HTML) then switching to Nesta 0.16.0 will automatically pull in Google's new JavaScript.

You'll also need to create a new GA4 property on analytics.google.com.

Don't forget to update the `google_analytics_code` value to your new "Measurement ID" in `config/config.yml`!

[CHANGELOG file]: https://github.com/gma/nesta/blob/v0.16.0/CHANGELOG.md
[the new template]: https://github.com/gma/nesta/blob/v0.16.0/views/analytics.haml
