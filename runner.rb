require "http"

print "enter item number:"
product_id = gets.chomp
response HTTP.get("http://localhost:3000/api/product")
p response.parse

response HTTP.get("http://localhost:3000/api/product/2")
p response.parse