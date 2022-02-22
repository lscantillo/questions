module LegacyDataProvider

  class QueryDataToJson
    def initialize
      @client = Mysql2::Client.new(host: ENV['WIZEQ_HOST'], database: ENV['WIZEQ_DATABASE'], username: ENV['WIZEQ_USERNAME'], password: ENV['WIZEQ_PASSWORD'])
    end

    def call (field_names, table_name)
      params = []
      field_names.each do |field|
        params << "'#{field}'"
        params << field
      end

      response = @client.query("SELECT JSON_OBJECT (#{params.join(',')}) FROM #{table_name}")
      response.map{|x| JSON.parse(x.values.first)}
    end
  end

  class DataRetriever
    @@questions_params = %w[question_id question user_hash is_anonymous createdAt updatedAt location last_email_notification_date assigned_department created_by_employee_id assigned_to_employee_id]
    @@answers_params = %w[answer_id answer_text answer_date answered_by_employee_id answered_question_id createdAt updatedAt]
    @@comments_params = %w[id questionId comment createdAt userName userEmail]
    @@votes_params = %w[id question_id user is_upvote]
    @@tags_params = %w[tag_id name]
    @@question_tags_params = %w[id question_id tag_id]
    @@users_params = %w[employee_id full_name email is_admin job_title]
    @@employees_departments_params = %w[id email department_id employee_id]
    @@employees_params = %w[email name is_admin job_title]
    @@departments_params = %w[department_id name is_active]

    def self.get_questions
      conn = QueryDataToJson.new
      conn.call(@@questions_params, 'Questions')
    end

    def self.get_answers
      conn = QueryDataToJson.new
      conn.call(@@answers_params, 'Answers')
    end

    def self.get_comments
      conn = QueryDataToJson.new
      conn.call(@@comments_params, 'Comments')
    end

    def self.get_votes
      conn = QueryDataToJson.new
      conn.call(@@votes_params, 'Votes')
    end

    def self.get_tags
      conn = QueryDataToJson.new
      conn.call(@@tags_params, 'Tags')
    end

    def self.get_question_tags
      conn = QueryDataToJson.new
      conn.call(@@question_tags_params, 'QuestionTags')
    end

    def self.get_users
      conn = QueryDataToJson.new
      conn.call(@@users_params, 'users')
    end

    def self.get_employees
      conn = QueryDataToJson.new
      conn.call(@@employees_params, 'Employees')
    end

    def self.get_employees_departments
      conn = QueryDataToJson.new
      conn.call(@@employees_departments_params, 'EmployeesDepartments')
    end

    def self.get_departments
      conn = QueryDataToJson.new
      conn.call(@@departments_params, 'Departments')
    end
  end
end
