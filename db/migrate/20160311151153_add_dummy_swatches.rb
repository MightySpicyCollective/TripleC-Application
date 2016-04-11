class AddDummySwatches < ActiveRecord::Migration
  def change
    add_column :classrooms, :dummy_swatch_color, :string
    add_column :schools, :dummy_swatch_color, :string
  end
end
