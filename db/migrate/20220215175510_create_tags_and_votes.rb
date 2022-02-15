class CreateTagsAndVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :name, limit: 30

      t.timestamps
    end

    create_table :votes do |t|
      t.boolean :is_up_vote, default: nil
      
      t.timestamps
    end
  end
end
