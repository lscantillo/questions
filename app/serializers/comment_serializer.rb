class CommentSerializer < ActiveModel::Serializer
  attributes :text_content, :is_answer,:employee_id,:question_id
end
