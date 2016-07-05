class AddSubjectToEnquiry < ActiveRecord::Migration
  def change
    add_column :enquiries, :subject, :string
  end
end
