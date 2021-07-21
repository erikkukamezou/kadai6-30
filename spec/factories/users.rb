FactoryBot.define do
  factory :user do
      id {100}
      name { 'test11' }
      email { 'test11@test.com' }
      password {'testtest11'}
      password_confirmation {'testtest11'}
      admin {false}
  end
  factory :second_user, class: User do
    id {102}
    name { 'test21' }
    email { 'test21@test.com' }
    password {'testtest21'}
    password_confirmation {'testtest21'}
    admin {true}
  end
  factory :third_user, class: User do
    id {103}
    name { 'test31' }
    email { 'test31@test.com' }
    password {'testtest31'}
    password_confirmation {'testtest31'}
    admin {false}
  end
  factory :fourth_user, class: User do
    id {104}
    name { 'test41' }
    email { 'test41@test.com' }
    password {'testtest41'}
    password_confirmation {'testtest41'}
    admin {false}
  end
  factory :fifth_user, class: User do
    id {105}
    name { 'test51' }
    email { 'test51@test.com' }
    password {'testtest51'}
    password_confirmation {'testtest51'}
    admin {false}
  end
end
