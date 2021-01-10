class Student < ActiveRecord::Base

    has_many :lessons
    belongs_to :teacher
    
end
