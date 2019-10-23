class AddColumnsInvitesAcceptedDenied < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :accepted, :boolean
    add_column :invites, :denied, :boolean
  end
end
