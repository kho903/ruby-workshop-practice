# Code Review Checklist

## 1. Code Smell이란?

- 코드의 가독성, 유지보수성을 떨어뜨릴 수 있는 징후
- 반드시 버그가 있다는 것은 아님
- 리펙터링이 필요한지 검토하는 기준

## 2. 대표적인 Code Smell

- Poor Naming: 의미가 불명확한 변수명, 메서드명
- Long Method: 하나의 메서드가 지나치게 많은 작업 수행
- Duplicate Code: 동일하거나 유사한 로직 반복
- Deep Nesting: 조건문 및 반복문의 과도한 중첩
- Magic Number: 의미를 설명하지 않은 숫자 사용
- Unnecessary Code: 불필요한 조건문, 변수, 코드

## 3. 코드 리뷰 순서

- 기존 코드의 목적과 동작 파악
- Code Smell 발견
- 문제점과 개선 이유 설명
- 리펙터링 진행
- 기존 동작 유지 여부 확인

## 4. 좋은 코드의 기준

- Readability: 가독성
- Maintainability: 유지보수성
- Consistency: 일관성
- Testability: 테스트 용이성

## 5. Code Smell 리팩터링 실습

### 1. 발견한 Code Smell

| Code Smell             | 원본 문제                             | 개선 방법                         |
| ---------------------- | ------------------------------------- | --------------------------------- |
| Poor Naming            | `doStuff`, `x`, `a`, `t`              | 의미 있는 변수명과 메서드명 사용  |
| Deep Nesting           | 중첩된 `if` 조건문                    | `next unless`로 중첩 제거         |
| Redundant Comparison   | `== true` 사용                        | Boolean 조건 직접 검사            |
| Duplicate Code         | 출력 문자열 및 조건식 중복            | 분류 결과를 변수에 저장           |
| Magic Number           | `100000` 직접 사용                    | `LARGE_ORDER_THRESHOLD` 상수 정의 |
| Unclear Responsibility | 검증, 계산, 출력을 한 메서드에서 처리 | 필요에 따라 메서드 책임 분리      |

### 2. 리펙터링 핵심

- 네이밍: 메서드와 변수의 역할을 명확히 표현
- 조건문: Guard Clause로 불필요한 중첩 제거
- 중복 제거: 반복되는 조건식과 출력 로직 통합
- 상수 활용: Magic Number에 의미 부여
- 동작 유지: 리펙터링 전후 실행 결과 동일하게 유지

### 3. 주의사항

- 모든 Code Smell이 반드시 수정해야 하는 문제는 아님
- 단순히 코드가 짧아지는 것보다 가독성이 중요
- 메서드 분리는 책임과 복잡도를 고려하여 결정
- 작은 프로그램에서는 하나의 메서드로 유지하는 것도 가능
- 리펙터링 후 기존 동작이 유지되는지 검증 필요
