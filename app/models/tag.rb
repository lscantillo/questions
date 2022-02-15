class Tag < ApplicationRecord
  has_many :questions_tags
  has_many :question, through: :questions_tags
end
