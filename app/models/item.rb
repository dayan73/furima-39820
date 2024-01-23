class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to : category.rb
  belongs_to : state.rb
  belongs_to : postage.rb
  belongs_to : region.rb
  belongs_to : transit_time.rb

  validates :image, presence: true
  validates :item, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :state_id, presence: true
  validates :postage_id, presence: true
  validates :region_id, presence: true
  validates :transit_time_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validate :validate_price_range
  validate :validate_price_format

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_area

  def validate_price_range
    unless price.nil?
      if price < 300 || price > 9_999_999
        errors.add(:price, "は¥300から¥9,999,999の範囲で入力してください")
      end
    end
  end

  def validate_price_format
    unless price.nil?
      if /\A[0-9]+\z/ !~ price.to_s
        errors.add(:price, "は半角数値で入力してください")
      end
    end
  end

  def sales_fee
    (price * 0.1).floor
  end

  def sales_profit
    price - sales_fee
  end
end
