class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      #t.integer :employee_id
      #t.integer :question_id
      t.string :text_content, limit: 600
      t.string :session_hash, limit: 255
      t.boolean :is_answer, default: false

      t.timestamps
    end
  end
end
