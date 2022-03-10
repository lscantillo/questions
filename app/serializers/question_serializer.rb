class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :header, :text_content

  has_many :comments
  has_many :votes
end
