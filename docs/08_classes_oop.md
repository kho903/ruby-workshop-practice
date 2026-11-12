# Classes & OOP (클래스와 객체지향)

## 1. Class & initialize

- `class`: 클래스 정의
- `initialize`: 객체 초기화 메서드 (Java 생성자와 유사)
- `@변수`: 인스턴스 변수
- `.new`: 객체 생성
- `end`: 클래스 및 메서드 종료

```ruby
class User
  def initialize(name)
    @name = name
  end
end

user = User.new("Jihun")
```

## 2. attr_reader / attr_writer / attr_accessor

- `attr_reader`: Getter 자동 생성
- `attr_writer`: Setter 자동 생성
- `attr_accessor`: Getter + Setter 자동 생성
- 인스턴스 변수에 접근하는 메서드를 간단하게 정의

```ruby
class User
  attr_reader :name
  attr_accessor :age

  def initialize(name, age)
    @name = name
    @age = age
  end
end

user = User.new("Jihun", 25)

puts user.name  # Jihun
user.age = 26   # Setter
puts user.age   # 26
```

## 3. Instance Methods / Class Methods

- 인스턴스 메서드: 객체를 통해 호출
- 클래스 메서드: 클래스를 통해 호출
- `self.method_name`: 클래스 메서드 정의에 사용 가능

```ruby
class Calculator
  def add(a, b)
    a + b
  end

  def self.description
    "Calculator"
  end
end

calc = Calculator.new

puts calc.add(10, 20)       #30
puts Calculator.description # Calculator
```

## 4. private

- 외부에 공개하지 않을 내부 메서드에 사용
- `private` 아래 정의된 메서드는 기본적으로 private
- 내부 구현을 감추고 책임을 명확하게 구분

```ruby
class User
  def valid?
    check_age
  end

  private

  def check_age
    true
  end
end
```

## 5. Inheritance (상속)

- `<`를 사용하여 클래스 상속
- 부모 클래스의 메서드 상속 가능
- `super`: 부모 클래스의 메서드 호출

```ruby
class Animal
  def speak
    "Hello"
  end
end

class Dog < Animal
end

puts Dog.new.speak # Hello
```

## 6. Java와의 차이

- Java 생성자 -> Ruby `initialize`
- Java `new User()` -> Ruby `User.new`
- Java `this` -> Ruby `self`
- Java 인스턴스 필드 -> Ruby `@variable`
- Java Getter/Setter -> Ruby `attr_reader`, `attr_accessor`
- Java `extends` -> Ruby `<`
- Ruby에서는 메서드와 클래스 선언을 `end`로 종료

### 코드 비교

```java
public class User {
    private String name;

    public User(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
```

```ruby
class User
  attr_reader :name

  def initialize(name)
    @name = name
  end
end
```
