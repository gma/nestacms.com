require 'rubygems'
require 'bundler/setup'

Bundler.require(:default)

require 'nesta/app'

use Rack::ForceDomain, ENV['DOMAIN']

Nesta::App.root = ::File.expand_path('.', ::File.dirname(__FILE__))
run Nesta::App
