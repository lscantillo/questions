class LigthQuestionSerializer < ActiveModel::Serializer
  attributes :id, :header, :text_content, :created_at, :vote_count, :comment_count, :is_anonymous
  has_one :employee, unless: -> { object.is_anonymous }
  has_one :department, unless: -> { object.department.nil? }

  def vote_count
    object.votes.count
  end

  def comment_count
    object.comments.count
  end

  class EmployeeSerializer < ActiveModel::Serializer
    attributes :full_name, :job_title, :profile_picture_url, :department
  end
end
