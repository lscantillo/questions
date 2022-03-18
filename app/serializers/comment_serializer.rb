class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text_content, :is_answer, :created_at
  has_one :employee, unless: -> { object.employee_id.nil? }
end
