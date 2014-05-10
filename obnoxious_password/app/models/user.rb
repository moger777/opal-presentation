require 'password_validator'

# NOTE: this is an example only, passwords save
# in plain text so make sure you take precautions on
# the off chance you copy and paste this code in a real
# app
class User < ActiveRecord::Base
  validate :password_meets_policy

  def password_meets_policy
    PasswordValidator.validate_password(password).each do |error|
      errors.add(:password, error)
    end
  end
end
