
class BankAccount
  attr_reader :owner, :balance
  attr_writer :nickname

  def initialize(owner, initial_balance = 0)
    @owner = owner
    @balance = initial_balance
    @nickname = nil
  end

  def deposit(amount)
    return false unless valid_amount?(amount)

    @balance += amount
    true
  end

  def withdraw(amount)
    return false unless valid_amount?(amount)
    return false if amount > @balance

    @balance -= amount
    true
  end

  def summary
    "예금주: #{@owner}, 잔액: #{@balance}, 닉네임: #{@nickname}"
  end

  private

  def valid_amount?(amount)
    amount.is_a?(Integer) && amount.positive?
  end
end

account = BankAccount.new("Jihun", 10_000)
account.nickname = "Main"

puts account.summary           # 예금주: Jihun, 잔액: 10000, 닉네임: Main
puts account.deposit(5_000)    # true
puts account.withdraw(3_000)   # true
puts account.balance           # 12000

puts account.deposit(0)        # false
puts account.deposit(-1_000)   # false
puts account.withdraw(-1_000)  # false
puts account.withdraw(20_000)  # false
puts account.withdraw(0)       # false

puts account.balance           # 12000
