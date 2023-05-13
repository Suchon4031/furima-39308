class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,             nill: false
      t.text :description,         nill: false
      t.integer :category_id,      nill: false
      t.integer :condition_id,     nill: false
      t.integer :delivery_fee_id,  nill: false
      t.integer :prefecture_id,    nill: false
      t.integer :delivery_date_id, nill: false
      t.integer :price,            nill: false
      t.references :user,          nill: false, foreign_key: true
      t.timestamps
    end
  end
end
