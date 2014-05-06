require 'opal'

module HelloWorldModule
  def hello
    'hello'
  end

  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def world
      foo = %w(w o r l d)
      foo.bar
    rescue
      foo.join
    end
  end
end

class Hello
  include HelloWorldModule

  def world
    self.class.world
  end
end

class World < Hello
  def hello
    "rube goldberg style #{super}"
  end

  def method_missing(name, *args, &block)
    name.to_s.split('_').map do |method|
      public_send(method)
    end.join(' ')
  end
end

puts World.new.hello_world
