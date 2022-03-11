class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :header, :created_at, :vote_count, :comment_count, :is_anonymous
  attributes :text_content, unless: -> { @instance_options.any?(%w[layout minimal]) }
  has_one :employee, unless: -> { object.is_anonymous }
  has_many :tags, unless: -> { object.tags.count.zero? }

  def vote_count
    object.votes.count
  end

  def comment_count
    object.comments.count
  end
end
