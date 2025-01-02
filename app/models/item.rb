class Item < ApplicationRecord

  validates :name, presence: true, length: { maximum: 255 }
  validates :pre_ordered_site, presence: true, length: { maximum: 65_535 }
  validates :price, length: { maximum: 255 }
  validates :note, length: { maximum: 65_535 }

  belongs_to :user, optional: true
  belongs_to :pre_ordered_site
end
