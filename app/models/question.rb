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

  validates :employee_id, association: Employee, unless: [proc { |question| question.employee_id.nil? }]
  validates :assigned_to_employee_id, association: Employee, unless: [proc { |question|
                                                                        question.assigned_to_employee_id.nil?
                                                                      }]
  validates :department_id, association: Department, unless: [proc { |question| question.department_id.nil? }]
  validates :location_id, association: Location, unless: [proc { |question| question.location_id.nil? }]

  def self.hottest
    question_ids = Vote.select(:question_id).group(:question_id).order(Arel.sql('COUNT(question_id) DESC')).pluck(:question_id)
    Question.find(question_ids).split(',')[0]
  end

  def self.interesting
    question_ids = Comment.select(:question_id).group(:question_id).order(Arel.sql('COUNT(question_id) DESC')).pluck(:question_id)
    Question.find(question_ids).split(',')[0]
  end

  def self.unanswered
    question_ids = Comment.select(:question_id).order('created_at DESC').where(is_answer: false).pluck(:question_id)
    Question.find(question_ids).split(',')[0]
  end
  
  def self.answered
    question_ids = Comment.select(:question_id).order('created_at DESC').where(is_answer: true).pluck(:question_id)
    Question.find(question_ids).split(',')[0]
  end
end
