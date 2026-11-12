=begin
loans = [
  { user: "Jihun", days_late: 3, returned: true, vip: false },
  { user: "Tanaka", days_late: 0, returned: true, vip: false },
  { user: "Sato", days_late: 7, returned: false, vip: false },
  { user: "Kim", days_late: 2, returned: true, vip: true },
  { user: "Lee", days_late: 5, returned: true, vip: false }
]

def doStuff(x)
  t = 0

  x.each do |a|
    if a[:returned] == true
      if a[:days_late] > 0
        if a[:vip] == true
          puts "#{a[:user]}: 0"
        else
          money = a[:days_late] * 500
          puts "#{a[:user]}: #{money}"
          t = t + money
        end
      else
        puts "#{a[:user]}: 0"
      end
    end
  end

  puts "Total fees: #{t}"
end

doStuff(loans)
=end
DAILY_LATE_FEE = 500
loans = [
  { user: "Jihun", days_late: 3, returned: true, vip: false },
  { user: "Tanaka", days_late: 0, returned: true, vip: false },
  { user: "Sato", days_late: 7, returned: false, vip: false },
  { user: "Kim", days_late: 2, returned: true, vip: true },
  { user: "Lee", days_late: 5, returned: true, vip: false }
]

def calculate_loan_fee(loan)
  return 0 if loan[:vip]
  return 0 if loan[:days_late] <= 0

  loan[:days_late] * DAILY_LATE_FEE
end

def calculate_total_fee(loans)
  returned_loans = loans.select do |loan|
    loan[:returned]
  end

  returned_loans.sum do |loan|
    calculate_loan_fee(loan)
  end
end

def print_loan_summary(loan, fee)
  puts "#{loan[:user]}: #{fee}"
end

def print_loan_report(loans)
  loans.each do |loan|
    next unless loan[:returned]

    fee = calculate_loan_fee(loan)
    print_loan_summary(loan, fee)
  end

  puts "Total fees: #{calculate_total_fee(loans)}"
end

print_loan_report(loans)