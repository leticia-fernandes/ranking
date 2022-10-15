class CreateDeputyExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :deputy_expenses do |t|
      t.integer :deputy_registration, index: true
      t.string :description
      t.date :date
      t.string :establishment
      t.decimal :value
      t.string :link_receipt

      t.timestamps
    end

    add_foreign_key :deputy_expenses, :deputies, column: :deputy_registration, primary_key: "registration"
  end
end
