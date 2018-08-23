class Category < ApplicationRecord
	has_many :product
	validates :name, presence: true, uniqueness: true

	before_destroy :ensure_not_referenced_by_any_product

	private
		def ensure_not_referenced_by_any_product
			unless products.empty?
				errors.add(:base, 'Product present')
				throw :abort
			end
		end
end