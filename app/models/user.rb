class User < ApplicationRecord
  has_many :groups, foreign_key: :creator_id, dependent: :destroy
  has_many :memberships, foreign_key: :member_id, dependent: :destroy
  has_many :transactions, foreign_key: :author_id
  validates :username, presence: true, length: { minimum: 4, maximum: 20 }, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ }

  after_save :notify_subscriber_of_addition

  private

  def notify_subscriber_of_addition
    RailsGroupTransactionsSchema.subscriptions.trigger('newUser', {}, self)
  end
end
