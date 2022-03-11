# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Departments info
departments = LegacyDataProvider::DataRetriever.get_departments
departments.each do |department|
  d = Department.new
  d.name = department['name']
  d.is_active = department['is_active']
  d.save
  # d.abbreviation = ???
end

# Current Locations
locations = LegacyDataProvider::DataRetriever.get_locations
locations.each do |location|
  l = Location.new
  l.name = location['name']
  l.code = location['code']
  l.save
end

# Current Users data
users = LegacyDataProvider::DataRetriever.get_users
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
admins = LegacyDataProvider::DataRetriever.get_employees_departments
admins.each do |admin|
  a = Employee.find_by_email(admin['email'])
  d = Department.find(admin['department_id'])
  a.department = d
  a.save
end

# Existing Tags
tags = LegacyDataProvider::DataRetriever.get_tags
tags.each do |tag|
  t = Tag.new
  t.id = tag['tag_id']
  t.name = tag['name']
  t.created_at = Time.now
  t.updated_at = Time.now
  t.save
end

# Questions!
questions = LegacyDataProvider::DataRetriever.get_questions
questions.each do |question|
  q = Question.new
  q.header = question['question']
  q.id = question['question_id']
  q.is_anonymous = question['is_anonymous']
  temp_location = Location.find_by_code(question['location'])
  q.location_id = temp_location.id
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
  last_email = question['last_email_notification_date']
  if last_email != nil
    q.last_email_notification_date = last_email.to_datetime
  end
  q.created_at = question['createdAt'].to_datetime
  q.updated_at = question['updatedAt'].to_datetime
  q.save
end

# Votes
votes = LegacyDataProvider::DataRetriever.get_votes
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
comments = LegacyDataProvider::DataRetriever.get_comments
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
  email = comment['userEmail']
  if  email == "" || email == nil
    c.employee_id = nil
  else
    temp_employee = Employee.find_by_email(email)
    c.employee_id = temp_employee.id
  end
  c.save
end

# Answers
answers = LegacyDataProvider::DataRetriever.get_answers
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
qTags = LegacyDataProvider::DataRetriever.get_question_tags
qTags.each do |qTag|
  qt = QuestionsTag.new
  qt.tag_id = qTag['tag_id']
  qt.question_id = qTag['question_id']
  qt.save
end
