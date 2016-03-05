class AddDummySwatchColorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dummy_swatch_color, :string
  end
end
