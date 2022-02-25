class AddQuestionsRelation < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :location, foreign_key: true
  end
end
