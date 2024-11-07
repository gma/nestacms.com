Date: 19:00 23 March 2023
Summary: Nesta 0.14.0 is out, and it brings a big new feature — Nesta can now be used as a Static Site Generator. This means that it's now easy to deploy Nesta to a host of JAMstack-focused hosting platforms, such as Netlify, GitHub Pages, AWS Amplify, etc. This release also includes a new library for converting Sass to CSS.
Link text: Nesta 0.14.0 released

# Nesta 0.14.0 is out (it's a big one)

Nesta 0.14.0 is out, and it brings the first significant new feature in almost a decade!

- Nesta can now be **used as a Static Site Generator**.

  This means that you can now join the cool kids and deploy Nesta to a host of JAMstack-focused hosting services like Netlify, GitHub Pages, AWS Amplify, Cloudflare (and many more).

- This release also includes a **new library for converting Sass** to CSS. This might require some minor code changes if you've got stylesheets written in Sass (see below for details).

- Setting config via environment variables is no longer supported directly, but can be achieved by reading the environment within `config.yml`. See the [CHANGES file] for tips on how to do that.

- Support for several (long since deprecated) features have been removed:

  - The `local_stylesheet?` helper method has been removed (deprecated in 0.9.1)
  - The `breadcrumb_label` helper method has been removed (deprecated in 0.9.3)
  - Plugins are no longer read from the `./plugins` directory (deprecated in 0.9.10)

- There have been a bunch of internal improvements to the code, which shouldn't affect you. See the [CHANGES file] for full details.

## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

Sass and SCSS files are now rendered with Dart Sass (the main implementation of Sass). We had been using the (now deprecated) [libsass library].

Sass has changed a bit since libsass was current, so you may need to make some small changes to your stylesheets. See the Sass [Breaking Changes] docs for full details of what's changed.

If that seems like a lot to read, you can do what I did to see if you've got any work to do:

- Fire up a local copy of your site (e.g. `bundle exec mr-sparkle`) and visit a few pages.
- If Sass thinks you've got some work to do it'll print deprecation warnings in the server logs, including links to pages documenting any changes you need to make. Easy!

[libsass library]: https://github.com/sass/libsass
[Breaking Changes]: https://sass-lang.com/documentation/breaking-changes

## Building a static site

There's a new command to build your sites, and a couple of new settings in `config.yml` to help you configure your build.

See the [Netlify deployment docs] for more, but this will give you a feel for how it works:

    $ cd mysite.com
    $ bundle exec nesta build  # builds in ./dist by default

If you'd like to build the output in another directory, specify it on the command line:

    $ bundle exec nesta build _site  # builds in ./_site

There are also two new config settings at the bottom of the [default config file], that you'll want to setup.

[Netlify deployment docs]: /docs/deployment/netlify
[default config file]: https://github.com/gma/nesta/blob/v0.14.0/templates/config/config.yml
[CHANGES file]: https://github.com/gma/nesta/blob/v0.14.0/CHANGES
