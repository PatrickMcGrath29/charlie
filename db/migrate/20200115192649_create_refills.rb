class CreateRefills < ActiveRecord::Migration[6.0]
  def change
    create_table :refills do |t|
      t.string :security_code
      t.integer :refill_amount
      t.string :charlie_card_number
      t.boolean :use_default_charlie_card
      t.belongs_to :user

      t.timestamps
    end
  end
end
