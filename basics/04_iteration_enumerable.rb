products = [
  { name: "Keyboard", price: 50000, stock: 10 },
  { name: "Mouse", price: 30000, stock: 0 },
  { name: "Monitor", price: 200000, stock: 5 },
  { name: "USB Cable", price: 10000, stock: 20 }
]

puts "=== Product Names ==="
products.each do |product|
  puts product[:name]
end

prices = products.map do |product|
  product[:price]
end
puts "Prices: #{prices}"

available = products.select do |product|
  product[:stock] > 0
end

available_product_names = available.map do |product|
  product[:name]
end

puts "Available Products: #{available_product_names}"

expensive = products.find do |product|
  product[:price] >= 100000
end
puts "First Expensive Product: #{expensive[:name]}"

total = products.sum do |product|
  product[:price]
end

puts "Total Price: #{total}"