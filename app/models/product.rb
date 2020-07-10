class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }
  validates :image_url, allow_blank: true, format: {
    with: %r{\.gif|jpg|png}i,
    message: 'must be a url for gif, jpg, or png image.'
  }

  def is_discounted?
    price < 2
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
