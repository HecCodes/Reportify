class Parent < ApplicationRecord
  validates :first_name, :last_name, :email, :teacher_id, presence:true
  validates :email, uniqueness:true
  has_many :children, foreign_key: :parent_id, class_name: :Student
  belongs_to :teacher, class_name: :User
end
