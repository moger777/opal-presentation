module PasswordValidator
  def self.validate_password(password)
    [].tap do |errors|
      errors << 'must contain number' unless password.match /\d/
      errors << 'must contain uppercase letter' unless password.match /[A-Z]/
      errors << 'must contain lowercase letter' unless password.match /[a-z]/
      errors << 'must contain one of the following characters !@#$%^&*()-_=+' unless password.match /[#{Regexp.escape('!@#$%^&*()-_=+')}]/
      errors << 'must be atleast 8 characters' unless password.length >= 8

      check_sequentials(errors, password)
      check_sequentials(errors, password.reverse)
      check_three_in_row(errors, password)
    end
  end

  def self.check_three_in_row(errors, password)
    password.each_char.each_with_index do |char, index|
      next_two = password[index + 1, 2]
      has_three_in_row = char == next_two[0] && char == next_two[1]

      if has_three_in_row
        errors << 'must not have more than 3 of the same character in a row'
        return
      end
    end
  end

  def self.check_sequentials(errors, password)
    password.each_char.each_with_index do |char, index|
      next_two = password[index + 1, 2]
      has_sequentials = next_two[0] == char.next && next_two[1] == char.next.next

      if has_sequentials
        errors << 'must not have more than 3 sequential characters'
        return
      end
    end
  end
end
