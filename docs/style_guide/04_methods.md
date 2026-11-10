# 04. Methods (메서드 설계)

## 1. 기본 원칙

- 하나의 메서드는 가능한 한 하나의 역할에 집중
- 메서드명으로 수행 목적을 명확히 표현
- 긴 메서드는 책임에 따라 분리
- 중복되는 로직은 공통 메서드로 추출

## 2. 메서드 길이 (Short Methods)

- Ruby Style Guide는 10줄 초과 메서드 지양
- 가능하면 5줄 미만의 짧은 메서드 권장
- 단, 무조건 짧게 만드는 것보다 가독성이 중요

## 3. 단일 책임 (Single Responsibility)

- 하나의 메서드에 여러 책임을 집중시키지 않음
- 검증, 계산, 출력 등의 역할을 분리
- 메서드 재사용성과 테스트 용이성 향상

```ruby
def adult?(user)
  user[:age] >= 18
end

def active?(user)
  user[:active]
end
```

## 4. 매개변수 (Arguments)

- 매개변수는 역할이 명확하도록 작성
- 불필요한 매개변수 지양
- 기본값이 있는 위치 인수는 뒤쪽에 배치 권장
- 선택적 설정값은 키워드 인수 활용 가능

```ruby
def discounted_price(price, rate: 10)
  price * (100 - rate) / 100
end

puts discounted_price(50000, rate: 20)
```

## 5. 반환 (Return Values)

- 마지막 표현식이 자동으로 반환됨
- 불필요한 `return` 지양
- Guard Clause 등 조기 반환에는 `return` 사용

```ruby
def total_price(price, quantity)
  price * quantity
end

def adult?(user)
  return false unless user

  user[:age] >= 18
end
```

## 6. Java와의 차이

- Java: 반환 타입 선언 필요
- Ruby: 반환 타입 선언 불필요
- Java: 일반적으로 명시적 `return` 사용
- Ruby: 마지막 표현식 암묵적 반환
- Java와 Ruby 모두 책임 분리 및 재사용성 중요
