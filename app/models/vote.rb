class Vote < ApplicationRecord
  belongs_to :question
  belongs_to :employee, optional: true

  validates :employee_id, association: Employee, unless: [proc { |vote| vote.employee_id.nil? }]
end
