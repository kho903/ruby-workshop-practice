products = [
  { name: "Keyboard", price: 50000, stock: 10 },
  { name: "Mouse", price: 30000, stock: 0 },
  { name: "Monitor", price: 200000, stock: 5 }
]
  
def in_stock?(product)
  # 재고 판단
  product[:stock] > 0
end

puts "Keyboard in stock: #{in_stock?(products[0])}"

def discounted_price(price, discount_percent = 10)
  # 할인 가격 계산
  price * (100 - discount_percent) / 100
end

puts "Discounted Price: #{discounted_price(products[0][:price])}"

def available_product_names(products)
  # select와 map 활용
  available_products = products.select do |product|
    in_stock?(product)
  end

  available_products.map do |product|
    product[:name]
  end
end

puts "Available Products: #{available_product_names(products)}"

# discounted_price는 정수 가격과 정수 할인율을 기준으로 구현하면 돼.


# 구현할 메서드 3개
# 1. in_stock?(product) — 상품의 재고가 1개 이상이면 true 반환
# 2. discounted_price(price, discount_percent = 10) — 상품 가격에 할인율을 적용해 반환
# 3. available_product_names(products) — 재고가 있는 상품의 이름만 배열로 반환 (select, map 활용)
# 예상 실행 결과

# Keyboard in stock: true
# Discounted Price: 45000
# Available Products: ["Keyboard", "Monitor"]

