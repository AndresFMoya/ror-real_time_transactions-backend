require 'rails_helper'

RSpec.describe Membership, type: :model do
  let(:membership) { FactoryBot.build(:membership) }

  it 'should have a member and a group' do
    expect(membership).to be_valid
  end

  it 'should not be valid whitout a member' do
    membership1 = FactoryBot.build(:membership, group: nil)
    expect(membership1).to_not be_valid
    expect(membership1.errors[:group]).to include('must exist')
  end

  it 'should not be valid whitout a group' do
    membership1 = FactoryBot.build(:membership, member: nil)
    expect(membership1).to_not be_valid
    expect(membership1.errors[:member]).to include('must exist')
  end
end
