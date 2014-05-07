require 'pathname'

unless Rails.env.production?
  Rails.application.config.assets.precompile += %w( opal-rspec-runner.js )

  Dir["#{Rails.root}/app/assets/javascripts/spec/**/*.rb"].each do |f|
    pathname = Pathname.new(f.gsub(/\.rb$/, '.js'))
    Rails.application.config.assets.precompile += [ "spec/#{pathname.basename}" ]
  end
end
