class CreateDocumentos < ActiveRecord::Migration[7.1]
  def change
    create_table :documentos do |t|
      t.string :title, null: false
      t.text :content

      t.timestamps
    end
  end
end
