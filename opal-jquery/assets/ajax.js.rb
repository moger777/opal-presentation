require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do
  HTTP.get 'the_partial.html' do |resp|
    Element.find('#target').html = resp.body
  end
end
