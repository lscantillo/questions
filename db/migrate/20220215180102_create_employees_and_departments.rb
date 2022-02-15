class CreateEmployeesAndDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :full_name, limit: 255
      t.string :email, limit: 255
      t.boolean :is_admin, default: false
      t.string :job_title, limit: 255
      t.string :profile_picture_url

      t.timestamps
    end

    create_table :departments do |t|
      t.string :name, limit: 30 
      t.boolean :is_active, default: true
      t.string :abbreviation, limit: 6
    end
  end
end
