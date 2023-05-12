FactoryBot.define do
  factory :user do
    transient do
      person {Gimei.name}
    end

    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {'1a'+ Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {person.last.kanji}
    firstname             {person.first.kanji}
    lastname_kana         {person.last.katakana}
    firstname_kana        {person.first.katakana}
    birth_date            {Faker::Date.backward}
  end
end