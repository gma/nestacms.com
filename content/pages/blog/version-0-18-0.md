Date: 13:20 19 November 2024
Summary: Nesta 0.18.0 is out, fixing a vulnerability in Sinatra.
Read more: Read on for details

# Nesta 0.18.0 released

GitHub recently notified us of a [security vulnerability in Sinatra], which has been fixed in Sinatra 4.1.

Nesta 0.17.0 moved to Sinatra 4.0, which means that if you've already upgraded to 0.17.0 then upgrading to 0.18.0 should be a trivial upgrade.

The only significant change in Nesta 0.18.0 is to upgrade Sinatra and pull in this security fix.

[security vulnerability in Sinatra]: https://github.com/advisories/GHSA-hxx2-7vcw-mqr3

## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

There should be no changes required to a site that's already running Nesta 0.17.0.

If your site isn't yet running Nesta 0.17.0, see the [release post] for upgrade instructions.

[release post]: /blog/version-0-17-0
