require 'bundler'
Bundler.require

run Opal::Server.new { |s|
  # the entry-point (main) to the app
  s.main = 'application'

  # add additional dirs to opal/sprockets load path
  s.append_path 'assets'
}

