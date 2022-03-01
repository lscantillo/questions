# frozen_string_literal: true

class Question < ApplicationRecord
  include PgSearch::Model
  belongs_to :employee, optional: true
  belongs_to :assigned_to_employee, class_name: 'Employee', optional: true
  belongs_to :department, optional: true

  has_many :comments
  has_many :questions_tags
  has_many :tags, through: :questions_tags

  has_many :votes
  belongs_to :location

  pg_search_scope :search,
                  against: %i[text_content header],
                  using: {
                    tsearch: { prefix: true }
                  }
end
