class Deputy < ApplicationRecord

  validates :registration, uniqueness: true, presence: true

  has_many :expenses, class_name: 'DeputyExpense', foreign_key: 'deputy_registration', primary_key: 'registration'

  scope :total_expenses, -> {
    select('deputies.*, SUM(value) as total')
    .left_outer_joins(:expenses)
    .group('deputy_registration')
    .order('total DESC')
  }
end
