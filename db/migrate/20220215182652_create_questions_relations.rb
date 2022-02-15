class CreateQuestionsRelations < ActiveRecord::Migration[7.0]
  def change
      add_reference :questions, :employee, foreign_key: true
      add_reference :questions, :assigned_to_employee, foreign_key: { to_table: :employees }
      add_reference :questions, :department, foreign_key: true
  end
end
