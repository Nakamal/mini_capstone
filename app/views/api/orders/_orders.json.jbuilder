json.user_id @order.user_id
json.product_id @order.product_id
json.quantity @order.quantity
json.subtotal @subtotal
json.tax @tax
json.total @total
# json.id @order.id
# json.user_email @order.user.email
# json.quantity @order.quantity
# json.price @order.price
# json.subtotal @order.subtotal
# json.tax @order.tax
# json.total @order.total

# json.product do
#   json.partial! @order.product, partial: "api/products/product", as: :product
# end
# json.user_email @order.user.email

# json.formatted do
#   json.price number_to_currency(@order.product.price)
#   json.subtotal number_to_currency(@order.subtotal)
#   json.tax number_to_currency(@order.tax)
#   json.total number_to_currency(@order.total)
# end
