
class CreditCardPayment
  def pay(amount)
    "Card payment: #{amount}"
  end
end

class BankTransferPayment
  def pay(amount)
    "Bank transfer: #{amount}"
  end
end

class Order
  def initialize(payment)
    change_payment(payment)
  end

  def checkout(amount)
    @payment.pay(amount)
  end

  def change_payment(payment)
    raise ArgumentError, "Invalid payment method" unless valid_payment?(payment)

    @payment = payment
  end

  private

  def valid_payment?(payment)
    payment.respond_to?(:pay)
  end
end

order = Order.new(CreditCardPayment.new)

puts order.checkout(10_000)

order.change_payment(BankTransferPayment.new)
puts order.checkout(20_000)

begin
  order.change_payment("invalid payment")
rescue ArgumentError => e
  puts e.message
end

puts order.checkout(500)