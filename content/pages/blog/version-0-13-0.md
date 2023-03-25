Date: 14:30 28 September 2022
Summary: Nesta 0.13.0 has been released, with updates to dependencies that were required to support Ruby 3.x and later. We've also pinned the version of Haml to the 5.x series, given the release of the backwards-incompatible 6.x branch.

# Nesta 0.13.0 released

Nesta 0.13.0 has been released, with updates to dependencies that were required to support Ruby 3.x and later.

We've also pinned the version of Haml that Nesta uses to the 5.x series, given the release of the backwards-incompatible 6.x branch. See the [Haml changelog] for details on that.

Nesta's internals have had a few tweaks and improvements, but they don't affect how Nesta works.

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

However, if you've added Ruby code (e.g. in your site's `app.rb` file) that references Ruby code in some of Nesta's dependencies, you may need to make some changes to support any API changes made by those libraries (e.g. Sinatra, Rack or Sass). You'll know if this applies to you!

[Haml changelog]: https://github.com/haml/haml/blob/main/CHANGELOG.md#600
[CHANGES file]: https://github.com/gma/nesta/blob/v0.13.0/CHANGES
