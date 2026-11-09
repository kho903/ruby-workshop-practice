# 01. 변수와 자료형 (Variables & Data Types)

## 1. 변수 (Variables)

- Ruby는 동적 타입 언어
- 변수 선언 시 자료형 명시 불필요
- 세미콜론(`;`) 생략 가능
- 변수명은 `snake_case` 사용

```ruby
name = "Jihun"
age = 25
is_active = true
```

## 2. 기본 자료형 (Data Types)

- `String`: 문자열
- `Integer`: 정수
- `Float`: 실수
- `TrueClass` / `FalseClass`: 참 / 거짓
- `NilClass`: 값이 없음을 나타내는 `nil`

```ruby
name = "Jihun"
age = 25
height = 175.5
is_active = true
value = nil
```

## 3. 출력 (Output)

- `puts`: 값 출력 후 줄바꿈
- `print`: 줄바꿈 없이 출력
- `p`: 디버깅에 유용한 형태로 출력
- `#{}`: 문자열 보간 (큰따옴표 문자열에서 사용)

```ruby
name = "Jihun"

puts "Hello, #{name}"
print "Hello"
p name
```

## 4. 자료형 확인 (Type Checking)

- `.class`: 객체의 클래스 확인
- `.is_a?`: 특정 클래스에 속하는지 확인

```ruby
age = 25

puts age.class          # Integer
puts age.is_a?(Integer) # true
```

## 5. Java와의 차이

- Java: 정적 타입 언어, 변수 선언 시 자료형 지정
- Ruby: 동적 타입 언어, 변수에 서로 다른 자료형의 값 재할당 가능
- Java의 `null` <-> Ruby의 `nil`
- Ruby에서는 `false`와 `nil`만 거짓으로 취급
- Ruby의 `0`, `""`는 참으로 취급
