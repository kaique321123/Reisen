class CreateNotices < ActiveRecord::Migration[6.1]
  def change
    create_table :notices do |t|
      t.string :title, null: false
      t.text :body
      t.boolean :visible, default: true, null: false

      t.timestamps
    end
  end
end
