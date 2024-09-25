class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :item_category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :option
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule
  validates :image, :item_name, :item_info, :item_category_id, :item_status_id, :option_id, :prefecture_id, :schedule_id, :item_price, presence: true
  validates :item_price, numericality: { less_than: 9_999_999, greater_than: 300 }

  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_status_id
    validates :option_id
    validates :prefecture_id
    validates :schedule_id
  end

  belongs_to :user
  has_one_attached :image
end