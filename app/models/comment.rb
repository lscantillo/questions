class Comment < ApplicationRecord
  belongs_to :employee, optional: true
  belongs_to :question
end
