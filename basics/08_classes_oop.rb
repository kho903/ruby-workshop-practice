
class Loan
  DAILY_LATE_FEE = 500

  attr_reader :user
  attr_accessor :days_late

  def initialize(user, days_late, vip)
    @user = user
    @days_late = days_late
    @vip = vip
  end

  def late_fee
    return 0 if @days_late <= 0
    return 0 if @vip
    days_late * DAILY_LATE_FEE
  end
end

loan = Loan.new("Jihun", 3, false)

puts "User: #{loan.user}"
puts "Late Fee: #{loan.late_fee}"

loan.days_late = 5

puts "Updated Late Fee: #{loan.late_fee}"
  