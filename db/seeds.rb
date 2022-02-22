# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

#Departments info
file = File.read(Rails.root.join('DatabaseJson','./Departments.json'))
departments = JSON.parse(file)
departments.each do |department|
  d = Department.new
  d.name = department['name']
  d.is_active = department['is_active']
  d.save
  # d.abbreviation = ???
end

# Current Users data
file = File.read(Rails.root.join('DatabaseJson','./Users.json'))
users = JSON.parse(file)
users.each do |user|
  u = Employee.new
  u.id = user['employee_id']
  u.full_name = user['full_name']
  u.email = user['email']
  u.is_admin = user['is_admin']
  u.job_title = user['job_title']
  u.profile_picture_url = user['profile_picture']
  u.created_at = Time.now
  u.updated_at = Time.now
  u.save
end

# Update Department for admins
file = File.read(Rails.root.join('DatabaseJson','./EmployeesDepartments.json'))
admins = JSON.parse(file)
admins.each do |admin|
  a = Employee.find_by_email(admin['email'])
  d = Department.find(admin['department_id'])
  a.department = d
  a.save
end

# Existing Tags
file = File.read(Rails.root.join('DatabaseJson','./Tags.json'))
tags = JSON.parse(file)
tags.each do |tag|
  t = Tag.new
  t.id = tag['tag_id']
  t.name = tag['name']
  t.created_at = Time.now
  t.updated_at = Time.now
  t.save
end

# Questions!
file = File.read(Rails.root.join('DatabaseJson','./Questions.json'))
questions = JSON.parse(file)
questions.each do |question|
  q = Question.new
  q.text_content = question['question']
  q.id = question['question_id']
  q.user_hash = "" # empty for now (?)
  q.is_anonymous = question['is_anonymous']
  q.location = question['location']
  asked_by = question['created_by_employee_id'].to_i
  if asked_by != 0
    q.employee_id = asked_by
  end
  assigned_to = question['assigned_to_employee_id'].to_i
  if assigned_to != 0
    q.assigned_to_employee_id = assigned_to
  end
  department = question['assigned_department'].to_i
  if department != 0
    q.department_id = department
  end
  q.last_email_notification_date = question['last_email_notification_date'].to_datetime
  q.created_at = question['createdAt'].to_datetime
  q.updated_at = question['updatedAt'].to_datetime
  q.save
end

# Votes
file = File.read(Rails.root.join('DatabaseJson','./Votes.json'))
votes = JSON.parse(file)
votes.each do |vote|
  v = Vote.new
  v.question_id = vote['question_id']
  v.is_up_vote = vote['is_upvote']
  v.created_at = Time.now
  v.updated_at = Time.now
  v.save
  # Most Likely not possible to recover
  # v.employee_id
end

# Comments
file = File.read(Rails.root.join('DatabaseJson','./Comments.json'))
comments = JSON.parse(file)
comments.each do |comment|
  c = Comment.new
  # theres a 3001 char answer !!!!
  ## c.id = comment['comment_id']
  c.text_content = comment['comment']
  c.session_hash = comment['sessionHash']
  c.is_answer = 0
  c.question_id = comment['questionId']
  c.created_at = comment['createdAt'].to_datetime
  c.updated_at = comment['createdAt'].to_datetime
  if comment['userEmail'] == ""
    c.employee_id = nil
  else
    temp_employee = Employee.find_by_email(comment['userEmail'])
    c.employee_id = temp_employee.id
  end
  c.save
end

# Answers
file = File.read(Rails.root.join('DatabaseJson','./Answers.json'))
answers = JSON.parse(file)
answers.each do |answer|
  a = Comment.new
  a.text_content = answer['answer_text']
  a.session_hash = answer['sessionHash']
  a.is_answer = 1
  a.question_id = answer['answered_question_id']
  responder = answer['answered_by_employee_id'].to_i
  a.employee_id =  responder unless responder == 0
  a.created_at = answer['answer_date'].to_datetime
  a.updated_at = answer['answer_date'].to_datetime
  a.save
end

# Question Tags
file = File.read(Rails.root.join('DatabaseJson','./QuestionsTags.json'))
qTags = JSON.parse(file)
qTags.each do |qTag|
  qt = QuestionsTag.new
  qt.tag_id = qTag['tag_id']
  qt.question_id = qTag['question_id']
  qt.save
end
