class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  with_options presence: true do
    validates :price,
              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
    validates :image
    validates :item_name
    validates :explanation   
    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :shipping_cost_id
      validates :prefecture_id
      validates :days_to_ship_id
    end
  end

end
