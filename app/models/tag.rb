class Tag < ApplicationRecord
  has_many :questions_tags
  has_many :questions, through: :questions_tags
end
