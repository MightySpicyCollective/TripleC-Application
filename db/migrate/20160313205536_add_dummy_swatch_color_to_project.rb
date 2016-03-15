class AddDummySwatchColorToProject < ActiveRecord::Migration
  def change
    add_column :projects, :dummy_swatch_color, :string
  end
end
