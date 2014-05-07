require "password_validator"

RSpec::Matchers.define :cause_error do |error_message|
  match do |password|
    errors = PasswordValidator.validate_password(password)
    errors.include?(error_message)
  end
end

describe PasswordValidator do
  it "should enforce that password contains number" do
    error_message = 'must contain number'

    expect('abc').to cause_error(error_message)
    expect('abc1').to_not cause_error(error_message)
  end

  it "should enforce that password contains uppercase letter" do
    error_message = 'must contain uppercase letter'

    expect('abc').to cause_error(error_message)
    expect('abC').to_not cause_error(error_message)
  end

  it "should enforce that password contains lowercase letter" do
    error_message = 'must contain lowercase letter'

    expect('ABC').to cause_error(error_message)
    expect('ABc').to_not cause_error(error_message)
  end

  it "should enforce that special character is included" do
    error_message = 'must contain one of the following characters !@#$%^&*()-_=+'

    expect('ABC').to cause_error(error_message)
    expect('ABC@').to_not cause_error(error_message)
  end

  it "should enforce that passwords are greater than or equal to 8 characters" do
    error_message = 'must be atleast 8 characters'

    expect('1234567').to cause_error(error_message)
    expect('12345678').to_not cause_error(error_message)
    expect('123456789').to_not cause_error(error_message)
  end

  it "should enforce that no more than 3 sequential characters in a row exist" do
    error_message = 'must not have more than 3 sequential characters'

    expect('abc').to cause_error(error_message)
    expect('cba').to cause_error(error_message)
    expect('123').to cause_error(error_message)
    expect('321').to cause_error(error_message)
    expect('acb').to_not cause_error(error_message)
  end
end
