class Vote < ApplicationRecord
  belongs_to :question
  belongs_to :employee
end
