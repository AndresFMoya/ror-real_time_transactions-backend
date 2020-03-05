FactoryBot.define do
  factory :transaction do
    author
    group
    amount { 100_000 }
  end
end
