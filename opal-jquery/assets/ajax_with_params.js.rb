require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do
  HTTP.post 'server', data: { foo: 'bar', car: 'dar' } do |resp|
    Element.find('#target').html = resp.body
  end
end
