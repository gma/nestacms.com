Date: 17:30 16 March 2015
Summary: Nesta 0.11.0 is out, with a few small improvements and support for Ruby&nbsp;2.2.
Read more: Read on to see what's changed

# Nesta 0.11.0 released

You can find the full list of updates in the [CHANGES file][].

Thanks to all who've contributed to this release, particularly Jordan Owens who worked his way through a bunch of outstanding bugs late last year.

## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

There are no changes to make to your sites.

## What's new?

These notes are pulled straight out of the [CHANGES file][].

- Allow Haml pages to use the built-in Markdown filter again, by
  including the haml-contrib gem.
  (Jordan Owens)

- When building the breadcrumb (e.g. "Home > Category > Page") for a
  page whose URL is at the top level of a site, include a page's first
  category in the breadcrumb.
  See <https://github.com/gma/nesta/issues/147> for an example.
  (Jordan Owens)

- Print an error message when one of Nesta's command line tools calls
  an external process (e.g. `git`), but the command doesn't return
  successfully. (Graham Ashton)

- When the menu.txt pointed to a page that didn't exist, Nesta would
  silently stop generating the menu, and links to pages further down
  the file would be ignored. This is now fixed; the missing page is
  ignored and the rest of the menu is generated. (Jordan Owens)

- Nesta previously expected all Markdown files to be named with a
  `.mdown` extension. The (commonly used) `.md` extension is now
  supported as well. (Phillip Miller)

- The Google Analytics JavaScript code has been updated to their
  Universal Analytics version. (Graham Ashton)

- Relax restrictions on how Nesta can be configured. Previously Nesta
  would only read if `config.yml` file if there weren't any environment
  variables set. This restriction is historic, and unhelpful.
  See <https://github.com/gma/nesta/commit/bac50974> for details.
  (Glenn Gillen)

- Plugins are distributed as gems. We've previously relied upon Bundler
  to generate plugin gems for us, but when Bundler changed the format
  of its generated gems they no longer worked with Nesta. Nesta now
  generates gems from scratch (from a template), which removes our
  dependency on a third party tool.
  (Jordan Owens, Glenn Gillen, Graham Ashton)

- Support for Ruby&nbsp;2.2. (Graham Ashton)

[CHANGES file]: https://github.com/gma/nesta/blob/master/CHANGES
