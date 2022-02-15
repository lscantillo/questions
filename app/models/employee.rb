class Employee < ApplicationRecord
  belongs_to :department

  has_many :posted_questions, class_name: 'Question'
  has_many :assigned_questions, class_name: 'Question', foreign_key: "assigned_to_employee_id"
  has_many :comments
  has_many :votes
end
