require 'bundler'
Bundler.require

use Rack::Static

run Opal::Server.new { |s|
  # add additional dirs to opal/sprockets load path
  s.append_path 'assets'
}
