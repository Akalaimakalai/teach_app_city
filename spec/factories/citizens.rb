# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    name { Faker::Name.unique.name }
    age { rand(0..90) }
    gender { ::Citizen::GENDERS.sample }
    state { 'alive' }

    trait :dead do
      state { 'dead' }
    end
  end
end
