Date: 17:30 6 November 2024
Summary: Nesta 0.17.0 is out. With it comes a couple of significant upgrades, including Sinatra, Rack, and Sass.
Read more: Read on for details

# Nesta 0.17.0 released

**Update:** GitHub recently notified us of a [security vulnerability in Sinatra]. Thinking that it was fixed by Sinatra 4.0, I promptly upgraded Nesta. As it turned out, that bug wasn't fixed until Sinatra 4.1 (Nesta 0.18.0 includes that fix). Version 0.17.0 cleared the way for the fix, however, so the notes below are still worth reading.

[security vulnerability in Sinatra]: https://github.com/advisories/GHSA-hxx2-7vcw-mqr3

Here are the main changes:

- We've upgraded from Sinatra 3.x to 4.x
- Nesta now runs on Rack 3, rather than Rack 2
- Sass has been updated to sass-embedded 1.80, which deprecates some Sass syntax

See below for more details, and links to pages that will help you modify your Sass files (should you need to).

## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

If you use Sass to generate your CSS, check the notes below. If you find that Sass is printing deprecation warnings as it generates your CSS, you could fix it now, or you could wait. The Sass team have committed not to remove support for the deprecated syntax for a while yet.

## What's new?

These notes are pulled straight out of the [CHANGELOG file][].

- Update Sinatra to verion 4.0, to fix a vulnerability. This has also
  required a jump to Rack 3. (Graham Ashton)

- Update Sass parser to `sass-embedded` 1.80, which (due to changes in CSS 4)
  deprecates the global colour functions and the `@import` statement. Any Sass
  code that uses these features will need updating before Dart Sass 3.0 is
  released. The Sass maintainers are saying we've got about two years.

  In the meantime Sass will print deprecation warnings, some of which give
  hints on how you might update your code.

  See the Nesta commit history for [an example] of the kind of changes that are
  required, and these pages for more details:

  - <https://sass-lang.com/documentation/breaking-changes/color-functions/>
  - <https://sass-lang.com/documentation/breaking-changes/import/>

  This update has also forced us to drop support for Ruby 3.0, which is no
  longer supported by the `sass-embedded` gem.

[CHANGELOG file]: https://github.com/gma/nesta/blob/v0.17.0/CHANGELOG.md
[an example]: https://github.com/gma/nesta/commit/127a1cfd3904e9452a3af0df174c6803f87a200e#diff-e6e959b2ad83d1d39676d48316701ca85d82043eb122f20493559b35958e8485
