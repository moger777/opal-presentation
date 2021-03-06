class JSWrapper
  def initialize(js_object)
    `
      (function(){
        var names = [];
        for (var key in js_object)  {
          if(typeof js_object[key] === 'function') {
            names.push(key);
          }
        }
        return names;
      })()
    `.each do |method_name|
      define_singleton_method method_name do |*args|
        returned_value = `js_object[method_name].apply(js_object, args)`
        returned_value = nil if `returned_value === void(0)`
        returned_value = nil if `returned_value === null`
        opal_compatible = `returned_value.$class ? true : false`

        if opal_compatible
          returned_value
        else
          JSWrapper.new(returned_value)
        end
      end
    end
  end
end

