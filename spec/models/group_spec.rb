require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { FactoryBot.build(:group) }

  it 'should have a name' do
    expect(group).to be_valid
  end

  it 'should not have an empty name' do
    group = FactoryBot.build(:group, name: '')
    expect(group).to_not be_valid
  end

  it 'should not have a too long description' do
    group = FactoryBot.build(:group, description: 'lorem' * 200)
    expect(group).to_not be_valid
    expect(group.errors[:description]).to include('is too long (maximum is 140 characters)')
  end

  it 'should have a creator' do
    group = FactoryBot.build(:group, creator_id: nil)
    expect(group).to_not be_valid
    expect(group.errors[:creator]).to include('must exist')
  end

  it 'should destroy dependent memberships created' do
    group1 = FactoryBot.create(:group, name: 'School expenses')
    user1 = FactoryBot.create(:user, username: 'user1', email: 'user1@example.com')
    membership = FactoryBot.create(:membership, group: group1, member: user1)
    expect { group1.destroy }.to change { Membership.count }.by(-1)
  end
end
