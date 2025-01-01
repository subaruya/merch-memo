class PreOrderedSite < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :url, length: { maximum: 255 }

  has_many :items

end
