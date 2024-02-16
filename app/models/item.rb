class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :postage
  belongs_to :region
  belongs_to :transit_time

  validates :image, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :trade_name, presence: true
  validates :state_id, presence: true
  validates :state_id, numericality: { other_than: 1 }
  validates :postage_id, presence: true
  validates :postage_id, numericality: { other_than: 1 }
  validates :region_id, presence: true
  validates :region_id, numericality: { other_than: 1 }
  validates :transit_time_id, presence: true
  validates :transit_time_id, numericality: { other_than: 1 }
  validates :price, presence: true, numericality: { only_integer: true }
  validate :validate_price_range
  validate :validate_price_format

  def validate_price_range
    return if price.nil?
    return unless price < 300 || price > 9_999_999

    errors.add(:price, 'は¥300から¥9,999,999の範囲で入力してください')
  end

  def validate_price_format
    return if price.nil?
    return unless /\A[0-9]+\z/ !~ price.to_s

    errors.add(:price, 'は半角数値で入力してください')
  end

  def sales_fee
    (price * 0.1).floor
  end

  def sales_profit
    price - sales_fee
  end

  def sold_out?
    purchase.present?
  end

  belongs_to :user
  has_one_attached :image
  has_one :purchase

end
