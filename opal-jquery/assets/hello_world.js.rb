require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do
  elm = Element.new('h1')
  elm.html = "Hello World"
  Element.find('body').append(elm)
end
