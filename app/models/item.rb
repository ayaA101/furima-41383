class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :option
  belongs_to :prefecture
  belongs_to :schedule
  validates :image, :item_name, :item_info, :item_category_id, :item_status_id, :option_id, :prefecture_id, :schedule_id, :price, presence: true
  validates :price, numericality: { less_than: 9_999_999, greater_than: 300 }

  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :item_category_id
    validates :item_status_id
    validates :option_id
    validates :prefecture_id
    validates :schedule_id
  end

  belongs_to :user
  has_one_attached :image
end