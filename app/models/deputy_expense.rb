class DeputyExpense < ApplicationRecord

  belongs_to :deputy, class_name: 'Deputy', primary_key: 'registration', foreign_key: 'deputy_registration'
end
