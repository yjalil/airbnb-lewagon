class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.string :status
      t.integer :hrayfi_id

      t.timestamps
    end
    add_reference :reservations, :job, null: false, foreign_key: true
    add_foreign_key :reservations, :users, column: :hrayfi_id
  end
end
