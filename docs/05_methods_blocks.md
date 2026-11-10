# 05. 메서드와 블록 (Methods & Blocks)

## 1. 메서드 (Methods)

- `def`: 메서드 정의
- `end`: 메서드 종료
- 반환 타입 선언 불필요
- 마지막 표현식이 자동으로 반환됨
- 메서드명은 `snake_case` 사용

```ruby
def add(a, b)
  a + b
end

puts add(10, 20) # 30
```

## 2. 매개변수 기본값 (Default Arguments)

- 매개변수에 기본값 지정 가능
- 인수 생략 시 기본값 사용

```ruby
def greet(name = "Guest")
  "Hello, #{name}"
end

puts greet("Jihun") # Hello, Jihun
puts greet          # Hello, Guest
```

## 3. Predicate 메서드 (?)

- 참·거짓을 판단하는 메서드에 `?` 사용
- Boolean 반환이 관례
- Java의 `isActive()`, `isEmpty()`와 유사

```ruby
def adult?(age)
  age >= 18
end

puts adult?(25) # true
puts adult?(15) # false
```

## 4. 블록 (Blocks)

- 메서드 호출 시 전달하는 코드 묶음
- `{ ... }`: 주로 한 줄 블록
- `do ... end`: 주로 여러 줄 블록
- `|변수|`: 블록 매개변수

```ruby
numbers = [1, 2, 3]

doubled = numbers.map { |n| n * 2 }

numbers.each do |number|
  puts number
end
```

## 5. yield

- 메서드에 전달된 블록을 실행
- `yield`를 만나면 블록의 코드가 실행됨
- 블록이 없는 상태에서 호출하면 오류 발생

```ruby
def repeat_twice
  2.times do
    yield
  end
end

repeat_twice { puts "Ruby" }

# Ruby
# Ruby
```

## 6. Java와의 차이

- Java: 메서드 반환 타입 선언 필요
- Ruby: 메서드 반환 타입 선언 불필요
- Ruby: 마지막 표현식 암묵적 반환
- Java Lambda <-> Ruby Block (유사한 역할)
- Ruby: `?`을 이용한 Predicate 네이밍
