class Teacher < ActiveRecord::Base

    has_many :lessons
    has_many :students, through: :lessons
    belongs_to :admin

end
