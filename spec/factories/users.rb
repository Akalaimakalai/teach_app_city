# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@test.com" }
    password { '123456' }
    password_confirmation { '123456' }

    after(:build) do |user|
      user.skip_confirmation!
    end
  end
end
