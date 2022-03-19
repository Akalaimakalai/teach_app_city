# frozen_string_literal: true

class CreateCitizens < ActiveRecord::Migration[7.0]
  def change
    create_table :citizens do |t|
      t.string :name, null: false
      t.integer :age, null: false, default: 0
      t.string :gender, null: false
      t.string :state, null: false, default: 'alive'

      t.timestamps
    end
  end
end
