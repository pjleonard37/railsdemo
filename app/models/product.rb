class Product < ActiveRecord::Base
	validates :title, :description, :image_url, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true
	validates :image_url, allow_blank: true, format: {
		with: 	  %r{\.(jpg|gif|png)\Z}i,
		message: 'must be a proper URL'
	}
	validates :title, length: {minimum: 10, 
		too_short: "title must be longer than 10 characters"}
end

def self.latest
  Product.order(:updated_at).last
end