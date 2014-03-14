require 'test_helper'

describe JSWrapper do
  it "should be able to call javascript methods" do
    method_called = false

    js_object = %x| {
        call_method: function() {
          method_called = true;
        }
      }
    |

    wrapper = JSWrapper.new(js_object)
    wrapper.call_method
    method_called.should == true
    expect(method_called).to be(true)
  end
end

