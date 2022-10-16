class Deputy < ApplicationRecord

  has_many :expenses, class_name: 'DeputyExpense', foreign_key: 'deputy_registration', primary_key: 'registration'

  scope :total_expenses, -> {
    select('*, SUM(value) as total').joins(:expenses).group('deputy_registration').order('total DESC')
  }
end
