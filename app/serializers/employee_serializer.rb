class EmployeeSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :email, :is_admin, :job_title, :profile_picture_url, :department_id
end
