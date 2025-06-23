# frozen_string_literal: true

FactoryBot.define do
  factory :domain do
    name { Faker::Internet.url }
  end
end
