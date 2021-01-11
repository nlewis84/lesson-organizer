class Admin < ActiveRecord::Base

    has_secure_password
    validates :email, presence: true, uniqueness: true

    has_many :teachers
    has_many :students

    # Returns the hash digest of the given string.
    def Admin.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
