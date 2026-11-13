
class Member
  @@created_count = 0
  ROLES = ["member", "premium"].freeze

  @plan_name = "Basic"

  attr_reader :name

  def initialize(name)
    @name = name
    @@created_count += 1
  end

  def self.created_count
    @@created_count
  end

  def self.plan_name
    @plan_name
  end
end

class PremiumMember < Member
  @plan_name = "Premium"
end

member = Member.new("Jihun")
premium = PremiumMember.new("Tanaka")

puts member.name
puts premium.name

puts Member.created_count
puts PremiumMember.created_count

puts Member.plan_name
puts PremiumMember.plan_name

puts Member::ROLES.frozen?

begin
  Member::ROLES << "admin"
rescue FrozenError => e
  puts e.class
end

Member::ROLES[0].upcase!
p Member::ROLES