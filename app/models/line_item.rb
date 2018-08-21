class LineItem < ApplicationRecord
	belongs_to :order, optional: true
	belongs_to :product, optional: true
	belongs_to :cart
 
  def total_price()
		tot_price = quantity * product.price
	end

	def reduce_qty
		quantity = quantity - 1
	end
end
