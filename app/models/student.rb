class Student < ActiveRecord::Base

    before_destroy :destroy_lessons

    has_many :lessons
    belongs_to :teacher
    belongs_to :admin
    
end
