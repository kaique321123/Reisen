class CreateUserFeedbacks < ActiveRecord::Migration[7.1]
  def change
    create_table :user_feedbacks do |t|
      t.string :author
      t.integer :rating
      t.text :comment

      t.timestamps
    end
  end
end
