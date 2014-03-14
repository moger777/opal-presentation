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
      define_singleton_method method_name do
        `js_object[method_name].call(js_object)`
      end
    end
  end
end

