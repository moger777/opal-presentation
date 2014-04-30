require 'opal'
require 'jquery'
require 'opal-jquery'

Document.ready? do
  target = Element.find('#target')

  target.on(:click, 'h2') do |event|
    target.append('<h2>was clicked</h2>')
  end

  # also works with custom events
  target.on('ourCustomEvent') do |event|
    target.append('<h2>custom event triggered</h2>')
  end
  `
    window.setInterval(function(){
      target.trigger('ourCustomEvent');
    }, 5000)
  `
end
