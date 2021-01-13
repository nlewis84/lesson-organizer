class Teacher < ActiveRecord::Base

    before_destroy :destroy_lessons

    has_many :lessons
    has_many :students, through: :lessons
    belongs_to :admin

end
