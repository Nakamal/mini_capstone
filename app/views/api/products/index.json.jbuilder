json.array! @products.each do |product|
  json.id product.id
  json.name product.name
  json.price product.price
  json.description product.description
  json.image_url product.image_url
  json.attunement product.attunement
  json.link "http://localhost:3000/api/products/#{product.id}"
end