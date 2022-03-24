class MinimalQuestionSerializer < ActiveModel::Serializer
  attributes :id, :header, :created_at, :vote_count, :comment_count, :is_anonymous
  has_one :employee, unless: -> { object.is_anonymous }
  has_many :tags, unless: -> { object.tags.count.zero? }

  def vote_count
    object.votes.count
  end

  def comment_count
    object.comments.count
  end

  class EmployeeSerializer < ActiveModel::Serializer
    attributes :full_name, :email, :is_admin, :job_title, :profile_picture_url
    has_one :department, unless: -> { object.department_id.nil? }
  end

  class DepartmentSerializer < ActiveModel::Serializer
    attributes :name, :is_active
  end

  class TagSerializer < ActiveModel::Serializer
    attributes :name
  end
end
