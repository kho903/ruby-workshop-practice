# 10. Keyword Arguments & Inheritance

## 1. Keyword Arguments

- 인수 이름을 명시하여 전달하는 방식
- `name:`처럼 기본값이 없으면 필수 인수
- `age: 20`처럼 기본값이 있으면 선택적 인수
- 인수의 의미가 명확해져 가독성 향상
- Ruby 3에서는 일반 위치 인수와 키워드 인수를 구별

```ruby
def introduce(name:, age: 20)
  "#{name} is #{age} years old"
end

puts introduce(name: "Jihun", age: 25)
puts introduce(name: "KIM")
```

## 2. Inheritance (상속)

- `<`를 사용하여 부모 클래스 상속
- 부모의 메서드 재사용 가능
- 자식 클래스에서 메서드 재정의 가능 (Override)
- Ruby는 클래스의 다중 상속을 지원하지 않음

```ruby
class Animal
  def speak
    "Hello"
  end
end

class Dog < Animal
  def speak
    "Woof!"
  end
end

puts Dog.new.speak # Woof!
```

## 3. super

- 부모 클래스에서 동일한 이름의 메서드 호출
- `initialize`에서도 사용 가능
- `super`: 현재 메서드가 받은 인수와 블록 전달
- `super()`: 인수 없이 호출 (블록은 전달 가능)
- `super(name: name)`: 지정한 키워드 인수를 전달
- `super(...)`: 인수 전달 문법을 사용하는 메서드에서 활용 가능

```ruby
class Animal
  def speak
    "Hello"
  end
end

class Dog < Animal
  def speak
    super + ", Woof!"
  end
end

puts Dog.new.speak # Hello, Woof!
```

## 4. Constructor & super

- 부모 클래스의 initialize는 자식 클래스에서 상속 가능
- 자식에서 initialize를 재정의했다면 필요에 따라 super 호출
- 부모가 관리하는 상태는 부모 initialize에 위임

```ruby
class User
  attr_reader :name

  def initialize(name:)
    @name = name
  end
end

class Admin < User
  attr_reader :role

  def initialize(name:, role:)
    super(name: name)
    @role = role
  end
end

admin = Admin.new(name: "Jihun", role: "admin")

puts admin.name # Jihun
puts admin.role
```

## 5. Java와의 차이

- Java `extends` -> Ruby `<`
- Java 생성자 -> Ruby `initialize`
- Java `super(...)` -> Ruby `super(...)`
- Ruby는 `super`만 작성하면 인수를 자동 전달
- Ruby에서는 자식 클래스의 `initialize`에서 필요에 따라 `super` 호출
- Ruby에서 메서드 오버라이딩에 `@Override` 같은 어노테이션 불필요

## 6. Keyword Arguments vs Positional Arguments

### Positional Arguments (위치 인수)

- 전달하는 순서에 따라 인수를 구분
- 호출할 때 인수의 의미가 명확하지 않을 수 있음

```ruby
def create_user(name, age)
  "#{name}, #{age}"
end

create_user("Jihun", 25)
```

### Keyword Arguments (키워드 인수)

- 인수의 이름을 명시하여 전달
- 순서에 의존하지 않아 가독성이 높음
- 필수 키워드와 기본값이 있는 키워드를 구분 가능

```ruby
def create_user(name:, age:)
  "#{name}, #{age}"
end

create_user(name: "Jihun", age: 25)
create_user(age: 25, name: "Jihun")
```

## 7. super vs super()

### super

- 부모 클래스의 동일한 이름의 메서드 호출
- 현재 메서드에 전달된 인수와 블록을 그대로 전달
- 키워드 인수도 함께 전달

```ruby
class Parent
  def greet(name)
    "Hello, #{name}"
  end
end

class Child < Parent
  def greet(name)
    super
  end
end

puts Child.new.greet("Jihun")
# Hello, Jihun
```

### super()

- 부모 클래스의 동일한 이름의 메서드를 인수 없이 호출
- 블록은 전달할 수 있음
- 부모 메서드에 필수 인수가 있다면 ArgumentError 발생

```ruby
class Parent
  def greet
    "Hello"
  end
end

class Child < Parent
  def greet(name)
    "#{super()}, #{name}"
  end
end

puts Child.new.greet("Jihun")
# Hello, Jihun
```

### super(인수)

- 부모 메서드에 전달할 인수를 직접 지정
- 자식 클래스에서 추가 인수를 받는 경우 유용

```ruby
class Employee
  def initialize(name:)
    @name = name
  end
end

class Manager < Employee
  def initialize(name:, bonus:)
    super(name: name)
    @bonus = bonus
  end
end
```

## 8. Java super vs Ruby super

### Java

- `super.methodName()`: 부모 메서드 지정 호출
- `super(...)`: 부모 생성자 호출

```java
class Employee {
    int monthlyPay() {
        return 3000000;
    }
}

class Manager extends Employee {
    @Override
    int monthlyPay() {
        return super.monthlyPay() + 500000;
    }
}
```

### Ruby

- `super`: 현재 메서드와 같은 이름의 부모 메서드 호출
- `initialize`에서도 `super` 사용 가능
- 별도의 부모 메서드 이름을 작성하지 않음

```ruby
class Employee
  def monthly_pay
    3_000_000
  end
end

class Manager < Employee
  def monthly_pay
    super + 500_000
  end
end
```

## 9. 핵심 비교

| 표현                  | 의미                                       |
| --------------------- | ------------------------------------------ |
| `super`               | 현재 인수와 블록 전달                      |
| `super()`             | 인수 없이 호출, 블록은 전달 가능           |
| `super(name: name)`   | 지정한 키워드 인수만 전달                  |
| Java `super.method()` | 부모의 특정 메서드 호출                    |
| Ruby `super`          | 현재 메서드와 같은 이름의 상위 메서드 호출 |

- Ruby에서는 `super`와 `super()`를 구분해야 함
- 자식 생성자에서 부모에 필요한 인수만 전달할 때 `super(...)` 활용
- 오버라이딩한 메서드에서도 부모 구현을 재사용할 수 있음
