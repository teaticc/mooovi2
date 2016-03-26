class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :nickname
      t.integer :rate
      t.text :review
      t.timestamps
    end
  end
end
