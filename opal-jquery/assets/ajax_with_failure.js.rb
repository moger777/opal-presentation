require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do
  HTTP.post 'fail' do |resp|
    if resp.ok?
      puts 'good'
    else
      puts 'bad'
    end

    #regardless run this
    Element.find('#target').html = resp.body
  end
end
