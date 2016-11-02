class CreateComments < ActiveRecord::Migration

  def change

    create_table :comments do |t|
      t.references :review, index: true
      t.references :user, index: true
      t.text :comment_text
      t.integer :rating_value, default: 0
      t.integer :rating_count, default: 0
      t.timestamps
    end

  end
  
end
