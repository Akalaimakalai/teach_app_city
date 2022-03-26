class CreateLinguists < ActiveRecord::Migration[7.0]
  def change
    create_table :linguists do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
