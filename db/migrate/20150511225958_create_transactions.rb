class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.float :nominal
      t.date :tanggal
      t.text :keterangan
      t.belongs_to :funding_source, index: true, foreign_key: true
      t.belongs_to :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
