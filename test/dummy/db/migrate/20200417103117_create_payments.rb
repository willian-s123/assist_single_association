class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.integer :user_id, null: false
      t.integer :pay_type, default: 0, null: false
    end
  end
end
