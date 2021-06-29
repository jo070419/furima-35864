FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'田中'}
    first_name            {'太郎'}
    ruby_last_name        {'タナカ'}
    ruby_first_name       {'タロウ'}
    birthday              {20000101}

  end
end