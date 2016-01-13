json.array!(@orders) do |order|
  json.extract! order, :id, :customer_id, :placed_on, :status, :price
  json.url order_url(order, format: :json)
end
