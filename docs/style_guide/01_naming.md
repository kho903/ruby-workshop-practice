# 01. Naming Conventions (명명 규칙)

## 1. 기본 원칙

- 이름만으로 변수와 메서드의 역할을 이해할 수 있어야 함
- 의미 없는 축약어 사용 지양
- 일관된 네이밍 규칙 유지
- Java와 Ruby의 네이밍 관례 차이 이해

## 2. snake_case

- 변수, 메서드, Symbol에 사용
- 파일 및 디렉터리 이름에도 사용

```ruby
user_name = "Jihun"
total_price = 50000

def find_active_users(users)
  # ...
end
```

## 3. PascalCase (CapitalCase)

- 클래스와 모듈 이름에 사용
- 각 단어의 첫 글자를 대문자로 작성

```ruby
class UserService
end

module PaymentProcessor
end
```

## 4. SCREAMING_SNAKE_CASE

- 일반 상수 이름에 사용
- 대문자와 언더스코어로 구성

```ruby
MAX_RETRY_COUNT = 3
DEFAULT_TIMEOUT = 30
```

## 5. Predicate Methods (?)

- 참·거짓을 판단하는 메서드에 `?` 사용
- Boolean 반환을 권장
- `is_`, `does_`, `can_` 등의 불필요한 접두어 지양

```ruby
def adult?(age)
  age >= 18
end

def in_stock?(product)
  product[:stock] > 0
end
```

## 6. Bang Methods (!)

- `!`는 일반적으로 더 위험한 동작을 구분하는 관례
- 안전한 대응 메서드가 있을 때 주로 사용
- `!`가 붙었다고 반드시 원본을 변경하는 것은 아님

```ruby
name = "ruby"

name.upcase     # 새 문자열 반환
name.upcase!    # 원본 문자열 변경
```

## 7. Java와의 차이

- Java 변수/메서드: `camelCase`
- Ruby 변수/메서드: `snake_case`
- Java 클래스: `PascalCase`
- Ruby 클래스: `PascalCase`
- Ruby: Predicate 메서드에 `?` 사용
- Ruby: 위험한 동작을 구분할 때 `!` 사용
