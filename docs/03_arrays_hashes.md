# 03. Array와 Hash

## 1. Array (배열)

- 여러 값을 순서대로 저장하는 자료구조
- Java의 `ArrayList`와 유사
- 서로 다른 자료형 저장 가능
- 인덱스는 0부터 시작

```ruby
languages = ["Java", "Ruby", "Python"]

puts language[0]        # Java
puts language.length    # 3

languages.push("Go")    # 요소 추가
languages.pop           # 마지막 요소 제거
```

## 2. Hash (해시)

- Key-Value 형태로 데이터 저장
- Java의 `HashMap`과 유사
- Key로 Symbol(`:name`)을 자주 사용
- Key를 통해 Value에 접근

```ruby
user = {
  name: "Jihun"
  age: 25,
  is_member: true
}

puts user[:name]    # Jihun
puts user[:age]     # 25

user[:age] = 26     # 값 수정
user[:email] = "test@example.com" # 추가
```

## 3. Array와 Hash 조합

- Array 안에 여러 Hash 저장 가능
- 사용자 목록, 상품 목록 등에서 활용

```ruby
users = [
    { name: "Jihun", age: 25 },
    {name: "Tanaka", age: 30}
]

puts user[0][:name] # Jihun
puts user[1][:age]  # 30
```

## 4. Java와의 차이

- Java `ArrayList` <-> Ruby `Array`
- Java `HashMap` <-> Ruby `Hash`
- Ruby Array는 서로 다른 자료형 저장 가능
- Ruby Hash는 Symbol을 Key로 자주 사용
- Ruby는 Array와 Hash를 리터럴로 간단하게 생성 가능
