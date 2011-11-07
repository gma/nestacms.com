require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'nesta/env'
Nesta::Env.root = ::File.expand_path('.', ::File.dirname(__FILE__))

require 'nesta/app'

use Rack::Rewrite do
  r301 %r{/articles.xml(\?.*)?}, 'http://feeds.feedburner.com/nesta-cms', :if => Proc.new { |rack_env|
    rack_env['HTTP_USER_AGENT'] !~ /FeedBurner/
  }
end

use Rack::ForceDomain, ENV["DOMAIN"]

run Nesta::App
