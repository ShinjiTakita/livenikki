class Post < ApplicationRecord
  has_many_attached :images

  validates :images, presence: true

  belongs_to :customer
  has_many :comments, dependent: :destroy
  belongs_to :tag
  has_many :favorites, dependent: :destroy

  def get_image
    if images.attached?
      images
    else
      'no_image.jpg'
    end
  end

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  def self.search(keyword)
    where(["title like? OR body like? OR setlist like? OR venue like?", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%"])
  end
end
