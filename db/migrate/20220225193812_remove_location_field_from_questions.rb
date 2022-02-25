class RemoveLocationFieldFromQuestions < ActiveRecord::Migration[7.0]
  def change
      remove_column :questions, :location, :string
  end
end
