require 'password_validator'

class User < ActiveRecord::Base
  validate :password_meets_policy

  def password_meets_policy
    PasswordValidator.validate_password(password).each do |error|
      errors.add(:password, error)
    end
  end
end
