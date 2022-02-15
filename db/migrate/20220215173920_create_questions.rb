class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :text_content, limit: 600
      t.string :user_hash, limit: 255
      t.boolean :is_anonymous, default: true
      t.string :location, limit: 255
      t.datetime :last_email_notification_date

      t.timestamps
    end
  end
end
