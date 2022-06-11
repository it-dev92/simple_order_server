# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    product_number { Faker::Number.number(6) }
    name { Faker::Lorem.sentence(word_count: 3) }
  end
end
