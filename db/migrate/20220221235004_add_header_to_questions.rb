class AddHeaderToQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :text_content, :header
    change_column :questions, :header, :string, limit: 500
    
    add_column :questions, :text_content, :string, default: nil
  end
end
