class QuestionsTag < ApplicationRecord
  has_many :questions
  has_many :tags
end
