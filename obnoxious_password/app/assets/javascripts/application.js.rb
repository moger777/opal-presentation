require 'opal'
require 'jquery'
require 'opal-jquery'
require 'password_validator'

Document.ready? do
  password_field = Element.find('#user_password')
  password_errors = Element.find('#password_errors')

  password_field.on(:keyup) do |event|
    password_errors.html = ''
    return if password_field.value.to_s.match /^\s*$/

    PasswordValidator.validate_password(password_field.value).each do |error|
      password_errors.append "<p style='color: red;'>#{error}</p>"
    end
  end
end
