class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.integer :stars
      t.string :comments

      t.timestamps
    end
  end
end
