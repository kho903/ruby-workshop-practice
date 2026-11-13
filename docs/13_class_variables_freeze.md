# 13. Class Variables & freeze

## 1. Instance Variables (@variable)

- `@variable`: 객체의 상태를 저장하는 인스턴스 변수
- 각 인스턴스가 독립적인 값을 가짐
- `initialize`에서 초기화하는 경우가 많음

```ruby
class User
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

a = User.new("Jihun")
b = User.new("Tanaka")

puts a.name # Jihun
puts b.name
```

## 2. Class Variables (@@variable)

- `@@variable`: 클래스 변수
- 클래스와 상속 계층에서 값을 공유
- 인스턴스 메서드와 클래스 메서드에서 접근 가능
- 공유 상태 때문에 예상하지 못한 영향이 발생할 수 있음

```ruby
class User
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end

User.new
User.new

puts User.count # 2
```

### 상속 관계에서의 공유

```ruby
class User
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end

class Admin < User
end

User.new
Admin.new

puts User.count     # 2
puts Admin.count    # 2
```

- 부모와 자식이 동일한 클래스 변수를 공유
- 자식 객체의 변경이 부모의 값에도 반영될 수 있음
- Ruby에서는 `@@variable`을 신중하게 사용

## 3. Class Instance Variables

- 클래스 자체도 객체이므로 인스턴스 변수를 가질 수 있음
- 클래스 본문에서 사용하는 `@variable`은 클래스 객체의 인스턴스 변수
- `@@variable`과 달리 부모·자식 클래스가 자동으로 동일한 값을 공유하지 않음
- 클래스별 설정이나 상태 관리에 활용 가능

```ruby
class User
  @role = "user"

  def self.role
    @role
  end
end

class Admin < User
  @role = "admin"
end

puts User.role  # user
puts Admin.role # admin
```

### 주의사항

- `@name`이 항상 일반 사용자 인스턴스의 변수를 뜻하는 것은 아님
- 현재 `self`가 어떤 객체인지에 따라 달라짐
- 클래스 메서드에서 `@variable`은 클래스 객체의 상태를 참조

## 4. Class Constants

- 대문자로 시작하는 이름으로 상수를 정의
- 클래스 내부의 설정값 등 표현하는 데 사용
- `ClassName::CONSTANT`로 외부 접근 가능
- Ruby 상수는 재할당이 완전히 금지되는 것은 아니며 경고가 발생할 수 있음
- 상수가 참조하는 객체도 자동으로 불변이 되지는 않음

```ruby
class Payment
  TAX_RATE = 0.1
end

puts Payment::TAX_RATE # 0.1
```

## 5. freeze

- 객체의 변경을 제한하는 메서드
- `freeze`된 객체를 변경하려 하면 일반적으로 `FrozenError` 발생
- `frozen?`로 동결 여부 확인 가능
- 객체 자체를 변경하지 않는 작업은 가능

```ruby
name = "Ruby"
name.freeze

puts name.frozen? # true

# name << "!" # FrozenError
```

### 배열에서의 freeze

```ruby
numbers = [1, 2, 3].freeze

puts numbers.frozen? # true
# numbers << 4 # FrozenError
# numbers[0] = 10 # FrozenError
```

## 6. Shallow Freeze (얕은 동결)

- `freeze`는 기본적으로 객체 자신만 동결
- 내부에 포함된 다른 객체까지 자동으로 동결하지 않음
- 배열 자체는 변경할 수 없어도 내부 요소가 변경 가능한 객체라면 수정 가능

```ruby
names = ["Jihun", "Tanaka"].freeze

names[0].upcase!

p names
# ["JIHUN", "Tanaka"]
```

- 배열은 동결되었지만 내부 문자열은 동결되지 않음
- 깊은 불변성이 필요한 경우 내부 객체까지 별도로 고려해야 함

## 7. Constants & freeze

- 상수에 배열이나 Hash를 저장할 때 freeze를 활용할 수 있음
- 실수로 컬렉션 자체를 변경하는 것을 방지하는 데 도움

```ruby
class User
  ROLES = ["user", "admin"].freeze
end

puts User::ROLES.frozen? # true

# User::ROLES << "guest" # FrozenError
```

- `freeze`를 사용해도 내부 문자열은 수정할 수 있음
- 따라서 완전한 불변성을 보장한다고 생각하면 안 됨

## 8. Java static vs Ruby Class Variables

### Java

```java
class User {
    private static int count = 0;

    public User() {
        count++;
    }

    public static int getCount() {
        return count;
    }
}
```

### Ruby

```ruby
class User
  @@count = 0

  def initialize
    @@count += 1
  end

  def self.count
    @@count
  end
end
```

### 차이점

| 구분             | Java static               | Ruby @@variable                |
| ---------------- | ------------------------- | ------------------------------ |
| 소속             | 선언한 클래스             | 클래스 계층에서 공유           |
| 인스턴스 간 공유 | 가능                      | 가능                           |
| 상속 관계        | 필드가 선언 클래스에 소속 | 상속 계층의 공유 상태          |
| 주의사항         | 공유 상태 관리            | 상속 관계에서 예상치 못한 공유 |

- Ruby의 `@@variable`은 Java `static`과 완전히 같지 않음
- Ruby에서는 클래스 인스턴스 변수도 자주 활용

## 9. Java final vs Ruby freeze

### Java final

```java
final List<String> names = new ArrayList<>();

names.add("Jihun"); // 가능

// names = new ArrayList<>(); // 불가능
```

### Ruby freeze

```ruby
names = ["Jihun"].freeze

# names << "Tanaka" # FrozenError

names = ["Kim"] # 변수 재할당 가능
```

### 차이점

| 구분           | Java final 변수 | Ruby freeze    |
| -------------- | --------------- | -------------- |
| 적용대상       | 변수의 재할당   | 객체의 변경    |
| 변수 재할당    | 불가능          | 가능           |
| 객체 자체 변경 | 가능할 수 있음  | 제한됨         |
| 내부 객체 변경 | 가능할 수 있음  | 가능할 수 있음 |

- Java `final`은 변수의 재할당을 제한
- Ruby `freeze`는 객체 자체의 변경을 제한
- 두 기능은 서로 동일하지 않음
