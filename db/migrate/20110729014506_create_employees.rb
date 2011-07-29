class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :employee_firstName
      t.string :employee_lastName
      t.integer :branch_id
      t.date :employee_dateEmployed
      t.integer :job_id
      t.integer :department_id
      t.date :employee_birthday
      t.integer :employee_age
      t.string :employee_contactNumber
      t.string :employee_sss
      t.string :employee_tin
      t.text :employee_address

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
