# 14. OOP Comprehensive Refactoring

## 1. Object-Oriented Refactoring

- 기존 코드의 동작을 유지하면서 구조를 개선
- 클래스와 메서드에 적절한 책임 부여
- 중복 코드 제거
- 변경에 유연한 설계 고려
- 리팩터링 전후의 결과가 같은지 테스트

## 2. Single Responsibility Principle (SRP)

- 클래스는 하나의 주요 책임을 가지도록 설계
- 서로 다른 이유로 변경되는 로직은 분리 고려
- 메서드 또한 한 가지 역할에 집중

### 예시

- Product: 상품 정보 관리
- ShoppingCart: 상품 목록 및 금액 계산
- PercentageDiscount: 할인 정책 적용
- CardPayment: 카드 결제 처리
- BankTransferPayment: 계좌이체 처리

## 3. Encapsulation (캡슐화)

- 객체의 내부 상태를 외부에 직접 노출하지 않음
- 상태 변경을 적절한 메서드로 관리
- `attr_reader`: 필요한 값만 조회
- `private`: 외부에서 호출할 필요가 없는 메서드 은닉

## 4. Composition & Dependency Injection

- 다른 객체를 보유하고 기능을 활용
- 생성자를 통해 필요한 객체를 외부에서 전달받을 수 있음
- 특정 구현 클래스에 대한 의존성을 줄일 수 있음
- 객체 간 역할을 명확하게 구분

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

puts Car.new(Engine.new).start
```

## 5. Duck Typing & Polymorphism

- 객체의 구체적인 클래스보다 제공하는 메서드에 집중
- 서로 다른 객체가 같은 메서드를 지원하면 공통된 방식으로 사용 가능
- 명시적인 인터페이스 상속이 필수는 아님
- 메서드 호출에 필요한 동작과 인수 규약을 맞춰야 함

## 6. Guard Clause & Validation

- 잘못된 입력은 메서드 초반에 처리
- 중첩 조건문을 줄여 가독성 향상
- 검증 메서드는 책임에 맞게 분리
- 검증 결과를 실제 제어 흐름에 반영

```ruby
def valid_quantity?(quantity)
  quantity.is_a?(Integer) && quantity.positive?
end
```

## 7. Ruby OOP Code Review Checklist

- [ ] 클래스별 책임이 명확한가?
- [ ] 메서드 이름이 동작을 설명하는가?
- [ ] 중복 로직이 존재하지 않는가?
- [ ] 불필요하게 깊은 조건문이 없는가?
- [ ] 내부 상태를 적절하게 관리하는가?
- [ ] Duck Typing을 올바르게 활용했는가?
- [ ] 의존성 교체가 가능한가?
- [ ] 잘못된 입력을 처리하는가?
- [ ] 기존 동작을 유지하는가?

## 8. Java vs Ruby OOP Design

### Java

- Interface로 공통 동작을 정의할 수 있음
- 구현 클래스에서 `implements` 사용
- 생성자 주입을 통해 의존성 교체 가능
- `private`, `public`, `protected`로 접근 제어

```java
interface Payment {
    String pay(int amount);
}

class PaymentService {
    private final Payment payment;

    public PaymentService(Payment payment) {
        this.payment = payment;
    }

    public String checkout(int amount) {
        return payment.pay(amount);
    }
}
```

### Ruby

- 별도 인터페이스 선언 없이 같은 메서드를 지원하는 객체 활용 가능
- 생성자 주입을 통해 의존성 교체 가능
- `private`로 내부 구현 메서드 구분
- Duck Typing을 통해 다형성 구현- DiscountPolicy: 할인 금액 계산
- Payment: 결제 처리

```ruby
class PaymentService
  def initialize(payment)
    @payment = payment
  end

  def checkout(amount)
    @payment.pay(amount)
  end
end
```

### 핵심 차이

| 구분        | Java                            | Ruby                       |
| ----------- | ------------------------------- | -------------------------- |
| 공통 계약   | Interface 활용                  | Duck Typing 활용           |
| 의존성 주입 | 생성자 주입 및 DI 컨테이너 활용 | 생성자 등을 통한 객체 주입 |
| 다형성      | Interface / 상속                | Duck Typing / 상속         |
| 접근 제어   | 필드와 메서드                   | 주로 메서드                |
| 타입 오류   | 정적 타입 검사                  | 실행 시점 검사 중심        |

## 9. Workshop Review Points

### Readability (可読性)

- 변수와 메서드의 이름이 명확한가?
- 코드를 처음 보는 사람도 이해하기 쉬운가?

### Maintainability (保守性)

- 기능 변경 시 수정 범위가 작은가?
- 책임이 적절하게 분리되어 있는가?

### Consistency (統一性)

- 네이밍 규칙이 일관적인가?
- 들여쓰기와 코드 스타일이 통일되어 있는가?

### Testability (テスト容易性)

- 각 메서드를 독립적으로 검증할 수 있는가?
- 정상 및 예외 상황을 테스트할 수 있는가?

## 10. 최종 목표

- 기존 코드의 문제점 설명
- 객체지향 구조로 리팩터링
- Ruby Style Guide 적용
- 기존 동작 검증
- 개선한 이유를 일본어로 설명

## 11. Refactoring vs Behavior Change

- Refactoring: 외부 동작을 유지하면서 내부 구조 개선
- Behavior Change: 새로운 기능이나 동작 변경
- 입력 검증 추가는 기존 동작을 바꿀 수 있음
- 리팩터링 전후의 정상 동작을 테스트로 확인
- 새로운 검증 규칙은 별도의 테스트로 확인
