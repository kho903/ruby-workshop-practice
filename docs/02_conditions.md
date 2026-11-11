# 02. 조건문 (Conditional Statements)

## 1. if / elsif / else

- `if`: 조건이 참이면 실행
- `elsif`: 이전 조건이 거짓일 때 추가 조건 검사
- `else`: 모든 조건이 거짓이면 실행
- `end`: 조건문 종료
- Java의 `else if` -> Ruby의 `elsif`

```ruby
age = 20

if age >= 20
  puts "Adult"
elsif age >= 18
  puts "Young Adult"
else
  puts "Minor"
end
```

## 2. unless

- 조건이 거짓일 때 실행
- `if !조건`과 비슷한 의미
- 단순한 부정 조건에 사용

```ruby
logged_in = false

unless logged_in
  puts "Please log in"
end
```

## 3. 조건문 후위 표현

- 단일 문장에 조건을 붙일 수 있음
- 간단한 조건에서 사용

```ruby
age = 25

puts "Adult" if age >= 18
puts "Minor" unless age >= 18
```

## 4. 비교 및 논리 연산자

- `==`: 동등 비교
- `!=`: 다름 비교
- `>`, `<`, `>=`, `<=`: 크기 비교
- `&&`: AND
- `||`: OR
- `!`: NOT

```ruby
age = 25
is_member = true

if age >= 18 && is_member
  puts "Adult Member"
end
```

## 5. Java와의 차이

- Java: `if`, `else if`, `else`
- Ruby: `if`, `elsif`, `else`
- Ruby는 `{}` 대신 `end`로 블록 종료
- Ruby는 `unless`와 조건문 후위 표현 지원
- Ruby는 `false`, `nil`만 거짓으로 취급
- Ruby의 조건식에는 `0`, `""`도 참으로 취급
