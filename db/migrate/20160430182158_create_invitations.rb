class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :invitee_id
      t.integer :event_id

      t.timestamps null: false
    end
    add_index :invitations, :invitee_id
    add_index :invitations, :event_id
    add_index :invitations, [:event_id, :invitee_id], unique: true

  end
end
