class Deputy < ApplicationRecord

  has_many :expenses, class_name: 'DeputyExpense', foreign_key: 'deputy_registration', primary_key: 'registration'
end
