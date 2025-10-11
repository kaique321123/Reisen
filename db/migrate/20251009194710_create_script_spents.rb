class CreateScriptSpents < ActiveRecord::Migration[7.1]
  def change
    create_table :script_spents do |t|
      t.decimal :amount
      t.references :user, null: false, foreign_key: true
      t.references :script, null: false, foreign_key: true

      t.timestamps
    end
  end
end
