class CreateExpenses < ActiveRecord::Migration[5.0]
  def change
    create_table :expenses do |t|
      t.string :type
      t.date :date_expense
      t.string :concept
      t.references :category, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
