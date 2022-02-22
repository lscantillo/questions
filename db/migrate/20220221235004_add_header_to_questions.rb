class AddHeaderToQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :text_content, :header
    change_column :questions, :header, :string, limit: 500
    
    create_table :text_contents do |t|
      t.string :text , limit: 500
    end

    create_table :questions_optional_contents
    add_reference :questions_optional_contents, :questions, foreign_key: true
    add_reference :questions_optional_contents, :content, foreign_key: true, polymorphic: true


    
  end
end
