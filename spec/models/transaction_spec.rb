require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { FactoryBot.build(:transaction) }

  it 'should have an User and an amount' do
    expect(transaction).to be_valid
  end

  it 'should not be valid without an User' do
    transaction = FactoryBot.build(:transaction, author: nil)
    expect(transaction).to_not be_valid
  end

  it 'should have an amount greather than 0' do
    transaction = FactoryBot.build(:transaction, amount: 0)
    expect(transaction).to_not be_valid
  end
end
