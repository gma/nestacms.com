Date: 12:00 11 July 2023
Summary: Nesta 0.15.0 has been released, with support for Sinatra 3 and Tilt 2.2. There's no pressing need to upgrade unless you need compatibility with recent versions of either of these libraries.
Tilt
Link text: Nesta 0.15.0 released

# Nesta 0.15.0 released (upgrades to Sinatra and Tilt)

Nesta 0.15.0 has been released, with support for Sinatra 3 and Tilt 2.2. There's no pressing need to upgrade unless you need compatibility with recent versions of either of these libraries.

Here's a summary of the changes, taken from the [CHANGELOG file][]:

 * Upgrade to Sinatra 3. (Graham Ashton)

 * The `models.rb` file has been long and unnecessarily hard to navigate
   for too long. It has been split up into multiple files, one for each
   class. (Graham Ashton, suggested by Lilith River)

 * Remove support for the BlueCloth markdown library. Nesta uses Tilt
   for rendering Markdown, and BlueCloth support has been removed in
   Tilt 2.2.0. See [rtomayko/tilt#382][deprecated in Tilt] for details.
   (Graham Ashton)

   If your site uses BlueCloth, remove your call to `Tilt.prefer`,
   and Nesta will use its default Markdown processor. See Nesta's docs
   on [configuring the Markdown processor] for more details.
   (Graham Ashton)

   [configuring the Markdown processor]: https://nestacms.com/docs/creating-content/changing-the-markdown-processor

## Upgrading

To install the new version edit your site's `Gemfile` and **remove the version number** (if it has one) from the end of the line, then run:

    $ bundle update nesta

You should now be able to start up the site locally with `mr-sparkle`, and test it:

    $ bundle exec mr-sparkle

If you have any weird errors when you start your server it could be a result of there being some fairly old gems installed. Update the entire `bundle` and try again:

    $ bundle update
    $ bundle exec mr-sparkle

### Updating your code

If your site uses the default Markdown processing library (a gem known as RDiscount, which works "out of the box"), you don't have any changes to make.

If you changed the Markdown processor to BlueCloth, you'll need to switch to another processor. BlueCloth has been [deprecated in Tilt][], which Nesta uses to convert all sorts of templates into rendered markup.

See Nesta's docs on [configuring the Markdown processor] for more details.

[deprecated in Tilt]: https://github.com/rtomayko/tilt/issues/382
[CHANGELOG file]: https://github.com/gma/nesta/blob/v0.15.0/CHANGELOG.md
