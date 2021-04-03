# frozen_string_literal: true

class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :description
      t.float :amount

      t.timestamps
    end
  end
end
