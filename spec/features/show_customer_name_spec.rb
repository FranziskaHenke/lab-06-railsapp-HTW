require 'rails_helper'

describe "orders page", :type => :feature do
  before :each do
    @order = create(:order)
  end

  it "shows customer name" do
    visit "/orders/#{@order.customer_id}"
    expect(page).to have_content (:customer)
  end
end
