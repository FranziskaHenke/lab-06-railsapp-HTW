class Customer < ActiveRecord::Base
  has_many :orders

  def total
  	orders.sum(:price)
  	
  end
end
