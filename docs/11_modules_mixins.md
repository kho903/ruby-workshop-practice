# 11. Module & Mixin

## 1. Module

- `module`: 공통 메서드와 상수를 묶는 단위
- 클래스처럼 메서드를 정의할 수 있음
- 클래스와 달리 `ModuleName.new`로 직접 인스턴스를 생성할 수 없음
- 공통 기능 재사용 및 네임스페이스 구성에 사용

```ruby
module Greeting
  def greet
    "Hello!"
  end
end
```

## 2. Mixin & include

- Mixin: 모듈의 기능을 클래스에 혼합하여 재사용하는 방식
- `include`: 모듈의 인스턴스 메서드를 사용할 수 있게 함
- 여러 모듈을 하나의 클래스에 include 가능
- Ruby는 클래스 다중 상속 대신 Mixin을 활용할 수 있음

```ruby
module Greeting
  def greet
    "Hello"
  end
end

class User
  include Greeting
end

user = User.new

puts user.greet # Hello!
```

## 3. extend

- `extend`: 모듈의 메서드를 특정 객체의 메서드로 추가
- 클래스 본문에서 사용하면 클래스 객체의 메서드로 추가
- `include`와 달리 인스턴스가 아닌 클래스에서 직접 호출 가능

```ruby
module VersionInfo
  def version
    "1.0"
  end
end

class ApiClient
  extend VersionInfo
end

puts ApiClient.version # 1.0
```

## 4. prepend

- `prepend`: 메서드 탐색 순서에서 모듈을 클래스보다 앞에 배치
- 같은 이름의 메서드가 있으면 prepend된 모듈의 메서드가 먼저 호출
- `super`를 사용하여 다음 메서드로 실행을 넘길 수 있음
- 로깅이나 실행 전후 처리 등에 활용 가능

```ruby
module Logging
  def greet
    "LOG: #{super}"
  end
end

class User
  prepend Logging

  def greet
    "Hello!"
  end
end

puts User.new.greet # LOG: Hello!
```

## 5. Method Lookup (메서드 탐색)

- Ruby는 정해진 메서드 탐색 순서를 따라 메서드를 찾음
- `prepend` 모듈은 클래스보다 먼저 탐색
- `include` 모듈은 클래스 다음에 탐색
- `super`는 탐색 순서상 다음 메서드를 호출
- `.ancestors`로 탐색 순서 확인 가능

```ruby
module Greeting
end

module Logging
end

class User
  include Greeting
  prepend Logging
end

p User.ancestors
# [Logging, User, Greeting, Object, Kernel, BasicObject]
```

## 6. include vs extend vs prepend

| 구분    | 주요 역할                   | 호출 대상            |
| ------- | --------------------------- | -------------------- |
| include | 인스턴스 기능 재사용        | 인스턴스             |
| extend  | 특정 객체에 기능 추가       | 해당 객체            |
| prepend | 클래스보다 먼저 메서드 탐색 | 인스턴스 메서드 체인 |

## 7. Java와의 차이

- Java `interface`와 Ruby `module`은 일부 유사
- Java 인터페이스처럼 기능을 공유할 수 있지만 동일한 개념은 아님
- Ruby 모듈에는 실제 메서드 구현을 작성할 수 있음
- Java는 `implements`, Ruby는 `include` 등을 사용
- Ruby는 Duck Typing을 활용하여 객체의 메서드 지원 여부를 중시
- Ruby 모듈은 네임스페이스로도 활용 가능
