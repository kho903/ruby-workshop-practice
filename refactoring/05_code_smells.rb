=begin
orders = [
  { name: "Keyboard", price: 50000, quantity: 2, paid: true },
  { name: "Mouse", price: 30000, quantity: 1, paid: false },
  { name: "Monitor", price: 200000, quantity: 1, paid: true },
  { name: "USB Cable", price: 10000, quantity: 1, paid: true }
]

def doStuff(x)
  t = 0

  x.each do |a|
    if a[:paid] == true
      if a[:quantity] > 0
        money = a[:price] * a[:quantity]

        if money >= 100000
          puts "#{a[:name]}: Large order"
        else
          puts "#{a[:name]}: Regular order"
        end

        t = t + money
      end
    end
  end

  puts "Total: #{t}"
end

doStuff(orders)
=end
=begin
Keyboard: Large order
Monitor: Large order
USB Cable: Regular order
Total: 310000
=end


LARGE_ORDER_THRESHOLD = 100_000

orders = [
  { name: "Keyboard", price: 50000, quantity: 2, paid: true },
  { name: "Mouse", price: 30000, quantity: 1, paid: false },
  { name: "Monitor", price: 200000, quantity: 1, paid: true },
  { name: "USB Cable", price: 10000, quantity: 1, paid: true }
]

def print_order_summary(orders)
  total_amount = 0

  orders.each do |order|
    next unless order[:paid] && order[:quantity] > 0

    amount = order[:price] * order[:quantity]
    order_type = amount >= LARGE_ORDER_THRESHOLD ? "Large order" : "Regular order"

    puts "#{order[:name]}: #{order_type}"

    total_amount += amount
  end

  puts "Total: #{total_amount}"
end

print_order_summary(orders)
