require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do
  list = Element.find('ul.target')
  list.children.each do |list_item|
    list_item.html = list_item.html.reverse
  end
end

