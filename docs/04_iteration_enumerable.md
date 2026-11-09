# 04. 반복문과 컬렉션 메서드 (Iteration & Enumerable)

## 1. each

- 컬렉션의 각 요소를 순회
- Java의 `forEach()`와 유사
- 반환값은 원본 컬렉션

```ruby
numbers = [1, 2, 3, 4, 5]

numbers.each do |number|
  puts number
end
```

## 2. map

- 각 요소를 변환하여 새로운 배열 반환
- Java Stream의 `map()`과 유사

```ruby
numbers = [1, 2, 3, 4, 5]

doubled = numbers.map { |n| n * 2 }

p doubled # [2, 4, 6, 8, 10]
```

## 3. select

- 조건을 만족하는 요소만 추출
- Java Stream의 `filter()`와 유사

```ruby
numbers = [1, 2, 3, 4, 5]

evens = numbers.select { |n| n.even? }

p evens # [2, 4]
```

## 4. find

- 조건을 만족하는 첫 번째 요소 반환
- 일치하는 요소가 없으면 `nil` 반환

```ruby
numbers = [1, 2, 3, 4, 5]

result = numbers.find { |n| n > 3 }

puts result # 4
```

## 5. sum

- 요소들의 합계 계산
- 블록을 사용해 계산한 값도 합산 가능

```ruby
numbers = [1, 2, 3, 4, 5]

puts numbers.sum # 15

puts numbers.sum { |n| n * 2 } # 30
```

## 6. Java와의 차이

- Java: Stream API를 이용한 컬렉션 처리
- Ruby: Array에서 Enumerable 메서드를 직접 사용 가능
- Ruby 블록: `{ |x| ... }`, `do |x| ... end`
- `each`: 순회
- `map`: 변환
- `select`: 필터링
- `find`: 첫 번째 일치 요소 검색
- `sum`: 합산
