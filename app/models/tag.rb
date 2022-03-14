class Tag < ApplicationRecord
  has_many :questions_tags
  has_many :questions, through: :questions_tags

  def self.Tagization(tags)
    # Here we can set an algorithm for tag equalization
    tags.map { |tag| find_by_name(tag) || create(name: tag) }
  end
end
