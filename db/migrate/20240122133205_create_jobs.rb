class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :preview
      t.decimal :cost
      t.integer :hrayfi_id
      t.timestamps
    end
    add_foreign_key :jobs, :users, column: :hrayfi_id
  end
end
