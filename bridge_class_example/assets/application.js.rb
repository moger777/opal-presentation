require 'opal'
require 'native'

`
var SomeFunction = function(){};

SomeFunction.prototype.someMethod = function(){ return "some_string" };
SomeFunction.prototype.anotherMethod = function(){ return "another_string" };

`

class InheritsFromSomeFunction < `SomeFunction`
  alias_native :some_method, :someMethod
  alias_native :another_method, :anotherMethod
end

our_object = InheritsFromSomeFunction.new
puts our_object.some_method
puts our_object.another_method

some_js_object = `new SomeFunction()`
puts some_js_object.some_method

puts some_js_object.class
puts our_object.class
