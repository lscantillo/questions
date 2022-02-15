class CreateTableJoins < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tags, :questions, column_options: { foreign_key: true }

  end
end
