class AddColumnInvitesDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :details, :string
  end
end
