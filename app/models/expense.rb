class Expense < ApplicationRecord
  belongs_to :category

  validates :type, presence: true
  validates :date_expense, presence: true
  validates :concept, presence: true
  validates :category, presence: true
  validates :amount, presence: true
end
