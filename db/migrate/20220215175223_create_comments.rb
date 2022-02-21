class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text_content, limit: 3100  # theres a 2520 char comment !!!!!!!, 3001 answer :O !!!!!!1
      t.string :session_hash, limit: 255
      t.boolean :is_answer, default: false

      t.timestamps
    end
  end
end
