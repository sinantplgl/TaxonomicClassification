class User < ApplicationRecord
    enum role: [:admin, :user]
    has_secure_password validations: false
    validates_presence_of :password, on: :create
    before_create { raise "Password digest missing on new record" if password_digest.blank? }
end
