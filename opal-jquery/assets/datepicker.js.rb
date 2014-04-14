require 'opal'
require 'jquery'
require 'jquery-ui-datepicker'
require 'opal-jquery'

Element.module_eval do
  # can also be used as alias_native :someThingCamelCased, :some_thing_underscored
  alias_native :datepicker
end

Document.ready? do
  Element.find('input.datepicker').datepicker
end

