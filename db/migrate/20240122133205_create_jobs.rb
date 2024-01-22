class CreateJobs < ActiveRecord::Migration[7.1]
  def change
    create_table :jobs do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :preview
      t.decimal :cost

      t.timestamps
    end
  end
end
