class CreateTourists < ActiveRecord::Migration[7.0]
  def change
    create_table :tourists do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
