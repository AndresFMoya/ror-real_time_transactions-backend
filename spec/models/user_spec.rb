require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }

  it 'must be unique' do
    FactoryBot.create(:user)
    user = FactoryBot.build(:user)
    expect(user).to_not be_valid
    expect(user.errors[:username]).to include('has already been taken')
  end

  it 'should have a valid username' do
    expect(user).to be_valid
  end

  it 'should not have an empty username' do
    user = FactoryBot.build(:user, username: '')
    expect(user).to_not be_valid
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'should not have a too long username' do
    user = FactoryBot.build(:user, username: 'user' * 50)
    expect(user).to_not be_valid
    expect(user.errors[:username]).to include('is too long (maximum is 20 characters)')
  end

  it 'should not have a too short username' do
    user = FactoryBot.build(:user, username: 'us')
    expect(user).to_not be_valid
    expect(user.errors[:username]).to include('is too short (minimum is 4 characters)')
  end

  it 'should have a valid email' do
    expect(user).to be_valid
  end

  it 'should not have an empty email' do
    user = FactoryBot.build(:user, email: '')
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include('is invalid')
  end

  it 'should not have an invalid email' do
    user = FactoryBot.build(:user, email: 'usermail.com')
    expect(user).to_not be_valid
    expect(user.errors[:email]).to include('is invalid')
  end

  it 'could create many groups' do
    creator = User.reflect_on_association(:groups)
    expect(creator.macro).to eq(:has_many)
  end

  it 'could be a member of many groups' do
    member = User.reflect_on_association(:memberships)
    expect(member.macro).to eq(:has_many)
  end

  it 'destroys dependent groups created' do
    group1 = FactoryBot.create(:group, creator: user)
    expect { user.destroy }.to change { Group.count }.by(-1)
  end

  it 'destroys dependent memberships created' do
    member1 = FactoryBot.create(:user, username: 'member', email: 'member@example.com')
    group1 = FactoryBot.create(:group, creator: user)
    FactoryBot.create(:membership, member: member1, group: group1)
    expect { member1.destroy }.to change { Membership.count }.by(-1)
  end
end
