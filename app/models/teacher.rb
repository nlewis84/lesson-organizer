class Teacher < ActiveRecord::Base
    has_secure_password
    validates :username, presence: true, uniqueness: true


    has_many :lessons
    has_many :students, through: :lessons

    # Returns the hash digest of the given string.
    def Teacher.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

end
