class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string     :zip_code, null: false
      t.integer    :region_id, null: false
      t.string     :city, null: false
      t.integer    :house_number, null: false
      t.string     :building
      t.string     :phone_number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
