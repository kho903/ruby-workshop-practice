=begin
orders = [
  { name: "Keyboard", price: 50000, quantity: 2, paid: true },
  { name: "Mouse", price: 30000, quantity: 1, paid: false },
  { name: "Monitor", price: 200000, quantity: 1, paid: true },
  { name: "USB Cable", price: 10000, quantity: 0, paid: true }
]

def print_order_summary(orders)
  total = 0

  orders.each do |order|
    if order[:paid] && order[:quantity] > 0
      amount = order[:price] * order[:quantity]
      puts "#{order[:name]}: #{amount}"
      total += amount
    end
  end

  puts "Total: #{total}"
end

print_order_summary(orders)

요구사항
1. 주문이 처리 대상인지 판단하는 Predicate 메서드 분리
2. 주문 금액을 계산하는 메서드 분리
3. print_order_summary에서 분리한 메서드 재사용
4. 메서드명을 snake_case로 명확하게 작성
5. 기존 동작과 출력 결과 유지
예상 출력
Keyboard: 100000
Monitor: 200000
Total: 300000
=end


orders = [
  { name: "Keyboard", price: 50000, quantity: 2, paid: true },
  { name: "Mouse", price: 30000, quantity: 1, paid: false },
  { name: "Monitor", price: 200000, quantity: 1, paid: true },
  { name: "USB Cable", price: 10000, quantity: 0, paid: true }
]

def processable_order?(order)
  order[:paid] && order[:quantity] > 0
end

def order_amount(order)
  order[:price] * order[:quantity]
end

def print_order_summary(orders)
  total = 0

  orders.each do |order|
    next unless processable_order?(order)

    amount = order_amount(order)
    puts "#{order[:name]}: #{amount}"
    total += amount
  end

  puts "Total: #{total}"
end

print_order_summary(orders)
