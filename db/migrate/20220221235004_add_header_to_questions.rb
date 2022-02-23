class AddHeaderToQuestions < ActiveRecord::Migration[7.0]
  def change
    rename_column :questions, :text_content, :header

    reversible do |dir|
      dir.up { change_column :questions, :header, :string, limit: 500 }
      dir.down { change_column :questions, :header, :string, limit: nil }
    end

    add_column :questions, :text_content, :string, default: nil
  end
end
