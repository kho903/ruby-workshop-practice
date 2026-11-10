# before
=begin
users = [
  { name: "Jihun", age: 25, active: true },
  { name: "Tanaka", age: 17, active: true },
  { name: "Sato", age: 30, active: false }
]

def getData(x)
  x.select do |a|
    a[:age] >= 18 && a[:active]
  end.map do |b|
    b[:name]
  end
end

p getData(users)
=end

# after
users = [
  { name: "Jihun", age: 25, active: true },
  { name: "Tanaka", age: 17, active: true },
  { name: "Sato", age: 30, active: false }
]

def active_udult_names(users)
  users.select do |user|
    user[:age] >= 18 && user[:active]
  end.map do |user|
    user[:name]
  end
end

p active_udult_names(users)
=begin
5. 선택한 이름이 좋은 이유
- getData -> active_udult_names: 메서드의 목적과 반환값을 명확하게 표현
- x -> users: 유저가 여러 개 모여있는 해시 배열에서 꺼내오므로 users라고 명시
- a -> user: 현재 처리 중인 사용자 한 명을 표현
- b -> user: 이름을 추출하는 대상이 사용자 한 명임을 표현
=end

=begin
요구사항
1. getData를 역할이 명확한 snake_case 메서드명으로 수정
2. 매개변수 x를 의미 있는 이름으로 변경
3. 블록 변수 a, b를 의미 있는 이름으로 변경
4. 기존과 동일하게 동작하도록 유지
5. 선택한 이름이 좋은 이유를 생각해 보기
=end
