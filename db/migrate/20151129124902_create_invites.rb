class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :status
      t.belongs_to :sender
      t.belongs_to :reciever
      t.timestamps null: false
    end
  end
end
