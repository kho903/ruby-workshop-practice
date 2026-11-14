
items = [
  { name: "Keyboard", price: 50_000, quantity: 2 },
  { name: "Mouse", price: 30_000, quantity: 1 }
]
=begin
total = 0

items.each do |item|
  total += item[:price] * item[:quantity]
end

discount_rate = 10

final_total = total - (total * discount_rate / 100)

puts "Subtotal: #{total}"
puts "Total: #{final_total}"

payment_type = "card"

if payment_type == "card"
  puts "Card payment: #{final_total}"
elsif payment_type == "bank"
  puts "Bank transfer: #{final_total}"
end

payment_type = "bank"

if payment_type == "card"
  puts "Card payment: #{final_total}"
elsif payment_type == "bank"
  puts "Bank transfer: #{final_total}"
end
=end

class Product
  attr_reader :name, :price

  def initialize(name:, price:)
    raise ArgumentError, "Invalid product name" unless name.is_a?(String) && !name.empty?
    raise ArgumentError, "Invalid price" unless price.is_a?(Integer) && price.positive?

    @name = name
    @price = price
  end
end

class PercentageDiscount
  def initialize(rate:)
    unless rate.is_a?(Integer) && rate.between?(0, 100)
      raise ArgumentError, "Invalid discount rate"
    end

    @rate = rate
  end

  def apply(amount)
    raise ArgumentError, "Invalid amount" unless amount.is_a?(Integer) && amount >= 0

    amount - (amount * @rate / 100)
  end
end

class CardPayment
  def pay(amount)
    "Card payment: #{amount}"
  end
end

class BankTransferPayment
  def pay(amount)
    "Bank transfer: #{amount}"
  end
end

class ShoppingCart
  def initialize(payment:, discount_policy:)
    unless discount_policy.respond_to?(:apply)
      raise ArgumentError, "Invalid discount policy"
    end

    @items = []
    @discount_policy = discount_policy

    change_payment(payment)
  end

  def add_product(product, quantity:)
    raise ArgumentError, "Invalid product" unless product.is_a?(Product)
    raise ArgumentError, "Invalid quantity" unless valid_quantity?(quantity)

    @items << { product: product, quantity: quantity }
  end

  def subtotal
    @items.sum do |item|
      item[:product].price * item[:quantity]
    end
  end

  def total
    @discount_policy.apply(subtotal)
  end

  def checkout
    @payment.pay(total)
  end

  def change_payment(payment)
    raise ArgumentError, "Invalid payment method" unless payment.respond_to?(:pay)

    @payment = payment
  end

  private

  def valid_quantity?(quantity)
    quantity.is_a?(Integer) && quantity.positive?
  end
end

if __FILE__ == $PROGRAM_NAME
  cart = ShoppingCart.new(
    payment: CardPayment.new,
    discount_policy: PercentageDiscount.new(rate: 10)
  )

  keyboard = Product.new(name: "Keyboard", price: 50_000)
  mouse = Product.new(name: "Mouse", price: 30_000)

  cart.add_product(keyboard, quantity: 2)
  cart.add_product(mouse, quantity: 1)

  puts "Subtotal: #{cart.subtotal}"
  puts "Total: #{cart.total}"
  puts cart.checkout

  cart.change_payment(BankTransferPayment.new)
  puts cart.checkout
end

cart = ShoppingCart.new(
  payment: CardPayment.new,
  discount_policy: PercentageDiscount.new(rate: 10)
)

keyboard = Product.new(name: "Keyboard", price: 50_000)
mouse = Product.new(name: "Mouse", price: 30_000)

cart.add_product(keyboard, quantity: 2)
cart.add_product(mouse, quantity: 1)

puts "Subtotal: #{cart.subtotal}"
puts "Total: #{cart.total}"
puts cart.checkout

cart.change_payment(BankTransferPayment.new)
puts cart.checkout
