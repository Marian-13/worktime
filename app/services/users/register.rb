require_lib 'services'

require_service 'emails/validate'
require_service 'passwords/validate'

module Users
  class Register < Service
    params :email, :password, :password_confirmation

    def call
      Emails::Validate.(email: email).tap do |result|
        return result unless result.successful?
      end

      Passwords::Validate.(password: password, password_confirmation: password_confirmation).tap do |result|
        return result unless result.successful?
      end
    end
  end
end
