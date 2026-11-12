class Employee
  attr_reader :name, :base_salary

  def initialize(name:, base_salary:)
    @name = name
    @base_salary = base_salary
  end

  def monthly_pay
    base_salary
  end
end

class Manager < Employee
  attr_reader :bonus

  def initialize(name:, base_salary:, bonus: 0)
    super(name: name, base_salary: base_salary)
    @bonus = bonus
  end

  def monthly_pay
    super + @bonus
  end
end

employee = Employee.new(
  name: "Jihun",
  base_salary: 3_000_000
)

manager = Manager.new(
  name: "Tanaka",
  base_salary: 4_000_000,
  bonus: 500_000
)

puts employee.monthly_pay
puts manager.monthly_pay
puts manager.name
puts manager.bonus

manager = Manager.new(
  name: "Sato",
  base_salary: 4_000_000
)

puts manager.monthly_pay
