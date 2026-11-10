# 02. Source Code Layout (코드 작성 방식)

## 1. 들여쓰기 (Indentation)

- Tab 대신 공백 사용
- 들여쓰기는 공백 2칸
- 블록이 중첩되면 2칸씩 추가

```ruby
def greet(name)
  if name
    puts "Hello, #{name}"
  end
end
```

## 2. 공백 (Spacing)

- 연산자 양옆에 공백 사용
- 쉼표 뒤에 공백 사용
- 괄호 안쪽에 불필요한 공백 사용 금지
- 블록의 `{` 앞에 공백 사용

```ruby
total = 10 + 20
numbers = [1, 2, 3]

numbers.each { |n| puts n }
```

## 3. 빈 줄 (Blank Lines)

- 메서드 사이에 빈 줄 사용
- 논리적으로 구분되는 코드 사이에 빈 줄 사용
- 연속된 불필요한 빈 줄 지양

```ruby
def adult?(age)
  age >= 18
end

def active?(user)
  user[:active]
end
```

## 4. 줄 길이 (Line Length)

- 한 줄은 가급적 80자 이내
- 긴 표현식은 여러 줄로 분리
- 팀의 합의에 따라 길이 제한 조정 가능

## 5. 줄바꿈 및 세미콜론

- 파일 끝에 줄바꿈 추가
- 한 줄에 하나의 표현식 작성
- 문장 끝 세미콜론(`;`) 사용 지양
- 줄 끝의 불필요한 공백 제거

## 6. Java와의 차이

- Java: 일반적으로 공백 4칸 들여쓰기
- Ruby: 공백 2칸 들여쓰기
- Java: 문장 끝 세미콜론 사용
- Ruby: 일반적으로 세미콜론 생략
- Ruby: `end`로 블록 종료
