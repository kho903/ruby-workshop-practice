
module Loggable
  def log(message)
    puts "[LOG] #{message}"
  end
end

module ServiceInfo
  def service_name
    "Service: #{self.name}"
  end
end

module AuditLog
  def create_order(item)
    puts "[AUDIT] Creating order"
    super
  end
end

class OrderService
  include Loggable
  extend ServiceInfo
  prepend AuditLog

  def create_order(item)
    log("Created order: #{item}")
  end
end

class UserService
  include Loggable

  def register(name)
    log("Registered user: #{name}")
  end
end

order_service = OrderService.new
user_service = UserService.new

order_service.create_order("Keyboard")
user_service.register("Jihun")

puts OrderService.service_name

p OrderService.ancestors
  