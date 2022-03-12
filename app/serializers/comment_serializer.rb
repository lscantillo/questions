class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text_content, :is_answer,:employee_id,:question_id
end
