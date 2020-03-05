class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :memberships, foreign_key: :group_id, dependent: :destroy
  has_many :transactions
  validates :description, length: { maximum: 140 }, allow_blank: true
  validates :name, length: { maximum: 40 }, presence: true

  after_save :notify_subscriber_of_addition

  private

  def notify_subscriber_of_addition
    RailsGroupTransactionsSchema.subscriptions.trigger('newGroup', {}, self)
  end
end
