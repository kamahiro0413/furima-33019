class UserPurchase
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_num, :user_id, :item_id, :token
  
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_num, length: { maximum:11 },format: { with: /\A[0-9]+\z/, message: "Input only number"}
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
   purchase = Purchase.create(item_id: item_id, user_id: user_id)
   Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name,phone_num: phone_num, purchase_id: purchase.id)
  end
end