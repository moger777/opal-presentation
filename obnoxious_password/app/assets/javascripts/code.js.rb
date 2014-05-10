require 'opal'
require 'opal-jquery'
require 'password_validator'
require 'error_message.opalerb'
require 'ostruct'

Document.ready? do
  password_field = Element.find('#user_password')
  password_errors = Element.find('#password_errors')

  password_field.on(:keyup) do |event|
    password_errors.html = ''
    return if password_field.value.to_s.match /^\s*$/

    PasswordValidator.validate_password(password_field.value).each do |error|
      message_struct = OpenStruct.new(message: error)
      password_errors.append Template['error_message'].render(message_struct)
    end
  end
end
