class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group, required: false
  validates :amount, numericality: { greater_than: 0 }
end
