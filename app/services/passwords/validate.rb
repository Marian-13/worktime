require_lib   'services'
require_value 'password'

module Passwords
  class Validate < Service
    params :password, :password_confirmation

    def call
      if password.blank?
        return Failure.with_desc('password is blank')
      end

      if password_confirmation.blank?
        return Failure.with_desc('password confirmation is blank')
      end

      if password.length < Password::MIN_LENGTH
        return Failure.with_desc('password is too short')
      end

      if password.length > Password::MAX_LENGTH
        return Failure.with_desc('password is too long')
      end

      if password != password_confirmation
        return Failure.with_desc('password does not match password confirmation')
      end

      Success.without_value
    end
  end
end
