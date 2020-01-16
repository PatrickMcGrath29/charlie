class AddCharlieCardPasswordToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :charlie_card_password, :string
  end
end
