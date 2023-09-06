class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.string :title
      t.string :description
      t.decimal :amount
      t.date :date
      t.string :income_type
      t.string :category

      t.timestamps
    end
  end
end
