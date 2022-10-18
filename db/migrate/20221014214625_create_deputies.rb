class CreateDeputies < ActiveRecord::Migration[7.0]
  def change
    create_table :deputies do |t|
      t.string :name
      t.integer :registration, index: { unique: true }, null: false
      t.string :uf
      t.string :party

      t.timestamps
    end
  end
end
