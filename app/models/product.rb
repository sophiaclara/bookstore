class Product < ApplicationRecord
	mount_uploader :image, ImageUploader
	has_many :line_items
	has_many :orders, through: :line_items
	before_destroy :ensure_not_referenced_by_any_line_item
	validates :title, :description, :image, presence: true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :title, uniqueness: true


	private
# ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		unless line_items.empty?
		errors.add(:base, 'Line Items present')
		throw :abort
		end
	end
end