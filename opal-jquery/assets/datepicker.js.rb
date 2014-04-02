require 'opal'
require 'jquery'
require 'jquery-ui-datepicker'
require 'opal-jquery'

Element.module_eval do
  expose :datepicker
end

Document.ready? do
  Element.find('input.datepicker').datepicker
end

