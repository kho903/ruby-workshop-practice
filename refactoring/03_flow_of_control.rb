# 문제 1. 주문 처리 코드 개선
=begin
orders = [
  { name: "Keyboard", paid: true, stock: 3 },
  { name: "Mouse", paid: false, stock: 5 },
  { name: "Monitor", paid: true, stock: 0 },
  { name: "USB Cable", paid: true, stock: 4 }
]

def print_ready_orders(orders)
  orders.each do |order|
    if order[:paid]
      if order[:stock] > 0
        puts "Ready: #{order[:name]}"
      end
    end
  end
end

print_ready_orders(orders)

요구사항
1. 중첩된 if문 제거
2. next if 또는 next unless 사용
3. 기존 출력 결과 유지
4. Ruby Style Guide에 맞게 작성
예상 결과:
Ready: Keyboard
Ready: USB Cable
=end

orders = [
  { name: "Keyboard", paid: true, stock: 3 },
  { name: "Mouse", paid: false, stock: 5 },
  { name: "Monitor", paid: true, stock: 0 },
  { name: "USB Cable", paid: true, stock: 4 }
]

def print_ready_orders(orders)
  orders.each do |order|
    next unless order[:paid]
    next if order[:stock] <= 0

    puts "Ready: #{order[:name]}"
  end
end

print_ready_orders(orders)

# 문제 2. 회원 접근 권한 확인
=begin
def access_message(user)
  if user
    if user[:active]
      if user[:age] >= 18
        "Access Granted"
      else
        "Access Denied"
      end
    else
      "Access Denied"
    end
  else
    "Access Denied"
  end
end

puts access_message({ age: 25, active: true })
puts access_message({ age: 17, active: true })
puts access_message(nil)
=end

def access_message(user)
  return "Access Denied" unless user
  return "Access Denied" unless user[:active]
  return "Access Denied" if user[:age] < 18
  "Access Granted"
end

puts access_message({ age: 25, active: true })
puts access_message({ age: 17, active: true })
puts access_message(nil)