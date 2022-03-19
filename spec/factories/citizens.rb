# frozen_string_literal: true

FactoryBot.define do
  factory :citizen do
    sequence(:name) do |n|
      "Name_#{n}"
    end

    age { rand(0..90) }
    gender { ::Citizen::GENDERS.sample }
    state { 'alive' }

    trait :dead do
      state { 'dead' }
    end
  end
end
