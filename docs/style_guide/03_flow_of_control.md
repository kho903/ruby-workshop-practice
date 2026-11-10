# 03. Flow of Control (흐름 제어)

## 1. 기본 원칙

- 불필요한 조건문 중첩 지양
- 조건이 단순하면 후위 `if` / `unless` 활용
- 예외 상황을 먼저 처리하는 Guard Clause 권장
- 기존 동작을 유지하면서 가독성 개선

## 2. Guard Clause

- 메서드 초반에 특정 조건을 검사하여 조기 반환
- 중첩된 조건문 감소
- `return if`, `return unless` 활용

```ruby
def process_order(order)
  return unless order[:paid]

  puts "Processing"
end
```

## 3. if / unless

- `if`: 조건이 참일 때 실행
- `unless`: 조건이 거짓일 때 실행
- 단순한 부정 조건에는 `unless` 권장
- `unless`와 `else` 조합 지양

```ruby
puts "Adult" if age >= 18
puts "Minor" unless age >= 18
```

## 4. return / next / break

- `return`: 메서드 종료 및 값 반환
- `next`: 반복문의 현재 반복을 건너뜀
- `break`: 반복문 종료
- 불필요한 `return`은 생략 가능

```ruby
numbers.each do |n|
  next if n.odd?

  puts n
end
```

## 5. case / when

- 같은 값을 여러 조건과 비교할 때 사용
- Java의 `switch`와 유사
- 여러 분기를 명확하게 표현

```ruby
case status
when "paid"
  puts "Completed"
when "pending"
  puts "Waiting"
else
  puts "Unknown"
end
```

## 6. Java와의 차이

- Java: 조기 반환에 `return` 사용
- Ruby: `return if`, `return unless` 활용
- Java: `continue` -> Ruby: `next`
- Java: `break` -> Ruby: `break`
- Java: `switch` -> Ruby: `case / when`
