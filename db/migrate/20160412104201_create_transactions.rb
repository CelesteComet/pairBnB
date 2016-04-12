class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :reservation_id
      t.string :braintree_transaction_id
      t.string :status
      t.string :last_4

      t.timestamps null: false
    end
  end
end
