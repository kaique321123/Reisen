# db/migrate/20251005123000_create_feedbacks.rb
class CreateFeedbacks < ActiveRecord::Migration[7.0]
  def change
    create_table :feedbacks do |t|
      t.string :titulo, null: false
      t.text :conteudo, null: false
      t.references :usuario, null: false, foreign_key: true

      t.timestamps
    end
  end
end
