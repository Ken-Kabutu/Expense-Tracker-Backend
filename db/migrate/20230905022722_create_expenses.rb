class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :expense_category, null: false, foreign_key: true
      t.decimal :amount
      t.date :date
      t.text :description

      t.timestamps
    end
  end
end
