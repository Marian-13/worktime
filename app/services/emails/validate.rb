require_lib 'services'

module Emails
  class Validate < Service
    params :email

    def call
      if email.blank?
        return Failure.with_desc('email is blank')
      end

      if !email.include?('@')
        return Failure.with_desc('email does not include @')
      end

      Success.without_value
    end
  end
end
