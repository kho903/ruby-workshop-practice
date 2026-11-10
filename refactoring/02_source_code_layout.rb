orders = [
  { name: "Keyboard", price: 50000, quantity: 2 },
  { name: "Mouse", price: 30000, quantity: 1 },
  { name: "Monitor", price: 200000, quantity: 1 }
]

def calculate_total(orders)
  total = 0
  
  orders.each do |order|
    total += order[:price] * order[:quantity]
  end

  total
end

def print_orders(orders)
  orders.each do |order|
    puts "#{order[:name]}: #{order[:quantity]}개"
  end
end

print_orders(orders)
puts "Total: #{calculate_total(orders)}"
