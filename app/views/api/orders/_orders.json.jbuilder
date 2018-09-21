json.id order.id
json.user_email order.user.email
json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.carted_products order.carted_products

json.formatted do
  json.subtotal number_to_currency(order.subtotal)
  json.tax number_to_currency(order.tax)
  json.total number_to_currency(order.total)
end
# json.product do
#   json.partial! @order.product, partial: "api/products/product", as: :product
# end
# json.user_email @order.user.email
