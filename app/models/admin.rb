class Admin < ActiveRecord::Base

    has_secure_password
    validates :email, presence: true, uniqueness: true

    has_many :teachers
    has_many :students

end
