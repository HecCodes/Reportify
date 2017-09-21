class Student < ApplicationRecord
  validates :first_name, :last_name,
  :teacher_id, presence:true

  belongs_to :teacher, class_name: :User

  belongs_to :parent
  has_many :reports, dependent: :destroy
end
