class Deputy < ApplicationRecord

  validates :registration, uniqueness: true, presence: true

  has_many :expenses, class_name: 'DeputyExpense', foreign_key: 'deputy_registration', primary_key: 'registration'

  scope :total_expenses, -> {
    select('deputies.*, t1.total ')
    .joins('inner join (
        SELECT deputy_registration as reg, SUM(value) as total
        FROM "deputies"
        INNER JOIN "deputy_expenses" ON "deputy_expenses"."deputy_registration" = "deputies"."registration"
        GROUP BY deputy_registration
      ) as t1 on deputies.registration = t1.reg'
    ).order('total DESC')
  }
end
