class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :author, null: false
      t.integer :rating, null: false
      t.text :comment, null: false

      t.timestamps
    end
  end
end
