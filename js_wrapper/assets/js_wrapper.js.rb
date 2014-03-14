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
        `js_object[method_name].apply(js_object, args)`
      end
    end
  end
end

