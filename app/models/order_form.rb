class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :region_id, :city, :house_number, :building, :phone_number, :purchase, :token

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :region_id, numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end
 

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id) 
    Address.create(zip_code: zip_code, region_id: region_id, city: city, house_number: house_number, building: building,  phone_number: phone_number, purchase_id: purchase.id) 
  end
  
end
