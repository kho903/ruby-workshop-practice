# 07. Minitest (테스트 코드)

## 1. Minitest란?

- Ruby의 경량 테스트 프레임워크
- Java의 JUnit과 유사
- 메서드의 예상 결과와 실제 결과 비교
- 리팩터링 전후 동작 검증에 활용

## 2. 기본 구조

- `require "minitest/autorun"`: 테스트 자동 실행
- `Minitest::Test`: 테스트 클래스 상속
- `test_`로 시작하는 메서드: 테스트 메서드
- `assert_equal`: 예상값과 실제값 비교

```ruby
require "minitest/autorun"

class CalculatorTest < Minitest::Test
  def test_add
    assert_equal 30, 10 + 20
  end
end
```

```ruby
require "minitest/autorun"

class CalculatorTest < Minitest::Test
  def test_add
    assert_equal 30, 10 + 20
  end
end
```

## 3. 주요 Assertion

- `assert_equal(expected, actual)`: 값 비교
- `assert(value)`: 참으로 취급되는지 확인
- `refute(value)`: 거짓으로 취급되는지 확인
- `assert_nil(value)`: nil인지 확인
- `assert_raises(ErrorClass)`: 예외 발생 확인

## 4. 테스트 대상

- 일반 회원 연체료 계산
- VIP 회원 연체료 면제
- 연체일 0일인 경우
- 미반납 대출의 합계 제외
- 전체 연체료 계산

## 5. 테스트 작성 원칙

- 하나의 테스트는 하나의 동작에 집중
- 테스트 이름으로 검증 목적 표현
- 정상값뿐 아니라 경계값도 검증
- 테스트는 독립적으로 실행 가능해야 함
- 리팩터링 후 전체 테스트 재실행
