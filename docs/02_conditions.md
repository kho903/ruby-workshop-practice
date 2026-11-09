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
end
```

## 5. Java와의 차이

- Java: `if`, `else if`, `else`
- Ruby: `if`, `elsif`, `else`
- Ruby는 `{}` 대신 `end`로 블록 종료
- Ruby는 `unless`와 조건문 후위 표현 지원
- Ruby는 `false`, `nil`만 거짓으로 취급
- Ruby의 조건식에는 `0`, `""`도 참으로 취급
