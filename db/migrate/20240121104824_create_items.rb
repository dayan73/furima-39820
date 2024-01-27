class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :trade_name, null: false
      t.text       :description, null: false
      t.integer    :state_id, null: false
      t.integer    :postage_id, null: false
      t.integer    :region_id, null: false
      t.integer    :transit_time_id, null: false
      t.integer    :price, null: false
      t.references :user, null: false, foreign_key: true
      t.integer    :category_id, null: false
      t.timestamps
    end
  end
end
