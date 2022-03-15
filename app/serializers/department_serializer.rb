class DepartmentSerializer < ActiveModel::Serializer
  attributes :id, :name, :is_active, :abbreviation,:employees
  has_many :employees
end
