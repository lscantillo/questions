class DepartmentSerializer < ActiveModel::Serializer
  attributes :name, :is_active, :abbreviation,:employees
  has_many :employees
end
