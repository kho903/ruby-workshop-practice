# 09. self & Access Control

## 1. self

- `self`: 현재 객체를 참조
- 인스턴스 메서드 내부: 현재 인스턴스
- 클래스 본문: 클래스 객체
- `def self.method_name`: 클래스 메서드 정의
- `self.attribute = value`: Setter 메서드 호출

```ruby
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end

  def self.description
    "User class"
  end
end

user = User.new("Jihun")
user.rename("Kim")

puts user.name          # Kim
puts User.description   # User class
```

## 2. self와 인스턴스 변수

- `@name`: 인스턴스 변수에 직접 접근
- `self.name`: Getter 메서드 호출
- `self.name = value`: Setter 메서드 호출
- `name = value`: 일반적으로 지역 변수에 할당

```ruby
class User
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def update_name(new_name)
    self.name = new_name
  end
end
```

## 3. public / private / protected

- `public`: 외부에서 호출 가능 (기본값)
- `private`: 클래스 내부 구현을 위한 메서드
- `protected`: 관련 클래스의 인스턴스 메서드 내부에서 다른 인스턴스를 대상으로도 호출 가능
- 접근 제어 키워드 아래의 메서드에 적용
- Java의 접근 제어와 세부 규칙이 다름

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

user = User.new

puts user.valid?    # true
# user.check_age    # NoMethodError
```

## 4. protected 예제

- 동일 클래스의 객체끼리 내부 값을 비교할 때 활용 가능
- 외부에서 직접 호출할 수 없음
- 해당 클래스 및 상속 관계에 있는 객체의 메서드 내부에서 접근 가능

```ruby
class Student
  def initialize(score)
    @score = score
  end

  def higher_than?(other)
    score > other.score
  end

  protected

  attr_reader :score
end

a = Student.new(90)
b = Student.new(80)

puts a.higher_than?(b) # true
# puts a.score # NoMethodError
```

## 5. attr_writer

- Setter 메서드만 자동 생성
- `attr_reader`: 읽기 전용
- `attr_writer`: 쓰기 전용
- `attr_accessor`: 읽기 + 쓰기

```ruby
class User
  attr_reader :name
  attr_writer :password

  def initialize(name)
    @name = name
  end
end

user = User.new("Jihun")

user.password = "1234"

puts user.name
# user.password # NoMethodError
```

## 6. Java와의 차이

- Java `this` <-> Ruby `self`
- Java 필드 `this.name` <-> Ruby 인스턴스 변수 `@name`
- Ruby의 `self.name`은 메서드 호출
- Ruby에서는 `attr_reader`, `attr_writer`로 접근자 자동 생성
- Ruby의 `protected`는 Java의 패키지 접근 규칙과 다름
- Ruby는 접근 제어를 주로 메서드에 적용
