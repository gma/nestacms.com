Date: 17:00 30 June 2020
Summary: Nesta 0.12.0 is out, bringing major upgrades to both Sinatra and Rack. Multiple security vulnerabilities have been addressed as a result.
Read more: Read on for more details

# Nesta 0.11.0 released

You can find the full list of updates in the [CHANGES file][].

## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

This new version of Nesta is backwards compatible, and doesn't require you to make any changes to your sites.

However, if you've added Ruby code (e.g. in your site's `app.rb` file) that references Ruby code in some of Nesta's dependencies, you may need to make some changes to support any API changes made by those libraries (e.g. Sinatra, Rack or Sass).

## What's new?

- Upgrade to Sinatra 2 and Rack 2, fixing [CVE-2020-8184] (reported by Brad Weslake). (Graham Ashton)

- Replace the deprecated sass gem with sassc. (Brad Weslake)

- Port the test suite from RSpec and Webrat to Minitest and Capybara. (Graham Ashton)

- Silence deprecation warnings produced under Ruby 2.7. (Graham Ashton)

- Stop running the test suite under Ruby 2.3 and 2.4, both of which have reached end-of-life. (Graham Ashton)

All dependencies have been updated, which has also fixed several CVEs in the `nokogiri` gem.

[CHANGES file]: https://github.com/gma/nesta/blob/master/CHANGES
[CVE-2020-8184]: https://github.com/advisories/GHSA-j6w9-fv6q-3q52
