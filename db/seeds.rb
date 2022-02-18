# frozen_string_literal: true
mapping_rules = {
  questions: {
    question_id: 'id',
    question: 'text_content',
    assigned_department: 'department_id',
    created_by_employee_id: 'employee_id'
  },
  answers: {
    answer_id: 'id',
    answered_text: 'text_content',
    answered_by_employee_id: 'employee_id',
    answered_question_id: 'question_id'
  },
  comments: {
    questionId: 'question_id',
    comment: 'text_content'
  },
  votes: {
    user: 'employee_id',
    is_upvote: 'is_up_vote'
  },
  tags: {
    tag_id: 'id'
  },
  employees: {
    name: 'full_name'
  }
 }
