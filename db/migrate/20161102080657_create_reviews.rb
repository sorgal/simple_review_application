class CreateReviews < ActiveRecord::Migration
  def change

    create_table :reviews do |t|
      t.references :user, index: true
      t.text :review_text, null: false
      t.integer :rating_value, default: 0
      t.integer :rating_count, default: 0
      t.timestamps
    end

  end
end
