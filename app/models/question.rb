# frozen_string_literal: true

class Question < ApplicationRecord
  include PgSearch::Model
  belongs_to :employee, optional: true
  belongs_to :assigned_to_employee, class_name: 'Employee', optional: true
  belongs_to :department, optional: true
  belongs_to :location, optional: true

  has_many :comments
  has_many :questions_tags
  has_many :tags, through: :questions_tags
  has_many :votes

  pg_search_scope :search,
                  against: %i[text_content header],
                  using: {
                    tsearch: { prefix: true }
                  }

  def self.hottest
    question_ids = Vote.select(:question_id).group(:question_id).order(Arel.sql('COUNT(question_id) DESC')).pluck(:question_id)
    Question.find(question_ids).split(',')
  end

  def self.insteresting
    question_ids = Comment.select(:question_id).group(:question_id).order(Arel.sql('COUNT(question_id) DESC')).pluck(:question_id)
    Question.find(question_ids).split(',')
  end
end
