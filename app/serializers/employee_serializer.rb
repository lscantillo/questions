class EmployeeSerializer < ActiveModel::Serializer
  attributes :full_name, :full_name, :email, :is_admin, :job_title, :profile_picture_url,:department_id 
end
