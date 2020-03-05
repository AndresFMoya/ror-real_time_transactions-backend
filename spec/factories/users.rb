FactoryBot.define do
  factory :user, aliases: %w[creator member author] do
    username { 'admin' }
    email { 'admin@example.com' }
  end
end
