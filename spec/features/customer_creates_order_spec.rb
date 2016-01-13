require 'rails_helper'

describe "customer page", :type => :feature do
  before :each do
    @customer = create(:customer)
  end

  it "has a create order link" do
    visit "/customers/#{@customer.id}"
    expect(page).to have_link 'New Order'
  end
  it "initializes new order correctly" do
    visit "/customers/#{@customer.id}"
    click_link 'New Order'
    fill_in 'Status', with: :new
    click_button 'Create Order'
    order = Order.last
    expect(order.customer).to eq @customer
  end

  it "shows customer's orders" do
  visit "/customers/#{@customer.id}"
  expect(page).to have_content (:order)
    
  end
  it "shows customer's total" do
  visit "/customers/#{@customer.id}"
  sum = @customer.orders.sum(:price)
  expect(page).to have_content (sum)
    
  end

end
