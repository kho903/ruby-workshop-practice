# 12. Composition & Duck Typing

## 1. Composition (객체 조합)

- 다른 객체를 인스턴스 변수로 보유하고 기능을 활용하는 설계 방식
- 상속(Is-A)과 달리 객체 간 협력(Has-A)을 활용
- 기능 변경 및 테스트가 쉬워질 수 있음
- "상속보다 조합을 우선 고려하라"는 객체지향 설계 원칙과 연결

```ruby
class Engine
  def start
    "Engine started"
  end
end

class Car
  def initialize(engine)
    @engine = engine
  end

  def start
    @engine.start
  end
end

car = Car.new(Engine.new)

puts car.start
# Engine started
```

## 2. Dependency Injection (의존성 주입)

- 객체가 사용할 의존성을 외부에서 전달받는 방식
- 생성자를 통한 의존성 주입이 대표적
- 특정 구현 클래스에 대한 결합도를 줄이는 데 도움
- Composition과 함께 활용 가능

```ruby
class Order
  def initialize(payment)
    @payment = payment
  end

  def checkout(amount)
    @payment.pay(amount)
  end
end
```

## 3. Duck Typing

- 구체적인 클래스보다 객체가 제공하는 메서드에 집중
- 같은 메서드를 지원하면 서로 다른 클래스도 동일하게 활용 가능
- 상속이나 명시적인 인터페이스 구현이 필수는 아님
- 실행 중 호출 가능한 메서드인지가 중요

```ruby
class Dog
  def speak
    "Woof!"
  end
end

class Cat
  def speak
    "Meow!"
  end
end

def make_sound(animal)
  animal.speak
end

puts make_sound(Dog.new)
puts make_sound(Cat.new)
```

## 4. respond_to?

- 객체가 특정 메서드 호출에 응답할 수 있는지 확인
- `respond_to?(:method_name)` 형태로 사용
- 반환값은 true 또는 false
- 일반적으로 public 메서드 기준으로 확인
- 필요하다면 두 번째 인수로 private/protected 메서드도 확인 가능

```ruby
class Dog
  def speak
    "Woof!"
  end
end

dog = Dog.new

puts dog.respond_to?(:speak) # true
puts dog.respond_to?(:fly)   # false
```

## 5. Polymorphism (다형성)

- 서로 다른 객체를 공통된 호출 방식으로 처리
- Ruby에서는 상속과 Duck Typing 등으로 구현 가능
- 객체마다 동일한 메서드에 대해 다른 동작 제공

```ruby
class CreditCard
  def pay(amount)
    "Card payment: #{amount}"
  end
end

class BankTransfer
  def pay(amount)
    "Bank transfer: #{amount}"
  end
end

payments = [CreditCard.new, BankTransfer.new]

payments.each do |payment|
  puts payment.pay(1000)
end
```

## 6. Composition vs Inheritance

| 구분   | Composition      | Inheritance           |
| ------ | ---------------- | --------------------- |
| 관계   | Has-A            | Is-A                  |
| 구현   | 다른 객체 보유   | 부모 클래스 상속      |
| 재사용 | 객체 간 협력     | 부모 기능 상속        |
| 유연성 | 의존성 교체 가능 | 상속 구조에 영향 받음 |

- Composition이 항상 상속보다 좋은 것은 아님
- 실제 관계와 변경 가능성을 고려하여 선택

## 7. Java와의 차이

- Java: Interface + 구현 클래스 + DI 활용
- Ruby: 별도 인터페이스 선언 없이 같은 메서드를 지원하면 협력 가능
- Java Spring: DI 컨테이너를 통한 의존성 주입 가능
- Ruby: 생성자에 객체를 직접 전달하는 방식도 일반적
- Ruby에서도 객체 간 의존성과 책임 분리는 중요

## 8. Java Interface vs Ruby Duck Typing

### Java - 인터페이스 기반 다형성

- Java에서는 인터페이스로 공통 메서드를 정의
- 구현 클래스에서 `implements`를 사용
- 컴파일 시점에 인터페이스 구현 여부를 검사
- 의존성 주입(DI)을 통해 구현 객체를 교체할 수 있음

```java
interface Payment {
    void pay(int amount);
}

class CardPayment implements Payment {
    @Override
    public void pay(int amount) {
        System.out.println("Card: " + amount);
    }
}

class Order {
    private final Payment payment;

    public Order(Payment payment) {
        this.payment = payment;
    }

    public void checkout(int amount) {
        payment.pay(amount);
    }
}
```

### Ruby - Duck Typing 기반 다형성

- 별도의 인터페이스 선언 없이 같은 메서드를 활용
- 객체의 클래스보다 객체가 제공하는 동작을 중시
- 실행 시점에 메서드 호출 가능 여부가 확인됨
- 생성자를 통해 다른 구현 객체를 주입할 수 있음

```ruby
class CardPayment
  def pay(amount)
    puts "Card: #{amount}"
  end
end

class Order
  def initialize(payment)
    @payment = payment
  end

  def checkout(amount)
    @payment.pay(amount)
  end
end
```

### 핵심 차이

| 구분        | Java                      | Ruby                          |
| ----------- | ------------------------- | ----------------------------- |
| 다형성      | 인터페이스 및 상속 기반   | Duck Typing 및 상속 기반      |
| 공통 메서드 | `interface`로 선언 가능   | 별도 선언 없이 사용 가능      |
| 타입 검사   | 컴파일 시점 중심          | 실행 시점 중심                |
| 의존성 주입 | 인터페이스 타입으로 전달  | 객체를 직접 전달              |
| 구현 교체   | 동일 인터페이스 구현 필요 | 필요한 메서드를 지원하면 가능 |

### 주의사항

- Ruby에서는 `Payment` 인터페이스를 반드시 정의할 필요가 없음
- `Order`는 구체적인 결제 클래스가 아닌 `pay` 메서드에 의존
- `pay` 메서드가 없다면 실행 중 `NoMethodError` 발생 가능
- 인수 개수가 맞지 않으면 `ArgumentError` 발생 가능
- `respond_to?(:pay)`로 메서드 지원 여부 확인 가능
- 단, `respond_to?`만으로 인수 형태나 올바른 동작까지 보장하지는 않음
