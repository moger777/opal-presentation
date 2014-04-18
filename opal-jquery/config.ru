require 'bundler'
Bundler.require

use Rack::Static

omg_fail = Proc.new do |env|
  request = Rack::Request.new(env)

  if request.path.match /^\/fail/
    [500, { 'Content-Type' => 'text/html' }, ["<h1>Oh Noes!</h1>"] ]
  else
    [404]
  end
end

param_echoer = Proc.new do |env|
  request = Rack::Request.new(env)

  if request.path.match /server/
    erb = File.open('the_partial_for_params.html.erb').read

    params = request.params
    method = request.request_method
    template = ERB.new(erb)
    html = template.result(binding)

    [200, { 'Content-Type' => 'text/html' }, [html] ]
  else
    [404]
  end
end

opal = Opal::Server.new { |s|
  # add additional dirs to opal/sprockets load path
  s.append_path 'assets'
}

cascade = Rack::Cascade.new([omg_fail, param_echoer, opal])
run cascade
