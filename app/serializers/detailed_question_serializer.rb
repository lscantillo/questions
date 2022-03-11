class DetailedQuestionSerializer < QuestionSerializer

  has_one :department, unless: -> { object.department.nil? }
  has_one :assigned_to_employee, unless: -> { object.assigned_to_employee.nil? }
  has_one :location, unless: -> { object.location.nil? }

  has_many :comments
end
