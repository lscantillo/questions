class DetailedQuestionSerializer < QuestionSerializer

  has_one :department, unless: -> { object.department.nil? }
  has_one :assigned_to_employee, unless: -> { object.assigned_to_employee.nil? }
  has_one :location, unless: -> { object.location.nil? }

  attribute :comments

  def comments
    return [] if object.comments.count.zero?

    object.comments.map do |comment|
      CommentSerializer.new(comment)
    end
  end
end
