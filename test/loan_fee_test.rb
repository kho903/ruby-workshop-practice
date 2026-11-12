require "minitest/autorun"
require_relative "../refactoring/06_comprehensive"

class LoanFeeTest < Minitest::Test
  # 1. 일반 회원이 3일 연체한 경우 (1500원)
  def test_normal_loan_fee
    loan = {
      user: "Jihun",
      days_late: 3,
      returned: true,
      vip: false
    }

    assert_equal 1500, calculate_loan_fee(loan)
  end

  # 2. VIP 회원이 5일 연체한 경우 (0원)
  def test_vip_loan_fee
    loan = {
      user: "Jihun",
      days_late: 5,
      returned: true,
      vip: true
    }

    assert_equal 0, calculate_loan_fee(loan)
  end

  # 3. 일반 회원이 연체하지 않은 경우 (0원)
  def test_no_late_fee
    loan = {
      user: "Jihun",
      days_late: 0,
      returned: true,
      vip: false
    }

    assert_equal 0, calculate_loan_fee(loan)
  end

  # 4. 일반 회원이 2일 연체한 경우 (1000원)
  def test_two_days_late_fee
    loan = {
      user: "Jihun",
      days_late: 2,
      returned: true,
      vip: false
    }

    assert_equal 1000, calculate_loan_fee(loan)
  end

  # 5. 미반납 기록이 포함된 경우 전체 합계 확인
  def test_total_fee_excludes_unreturned_loans
    loans = [
      { user: "Jihun", days_late: 3, returned: true, vip: false },
      { user: "Tanaka", days_late: 0, returned: true, vip: false },
      { user: "Sato", days_late: 7, returned: false, vip: false },
      { user: "Kim", days_late: 2, returned: true, vip: true },
      { user: "Lee", days_late: 5, returned: true, vip: false }
    ]
    assert_equal 4000, calculate_total_fee(loans)
  end
end
