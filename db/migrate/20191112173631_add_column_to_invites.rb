class AddColumnToInvites < ActiveRecord::Migration[5.2]
  def change
    add_column :invites, :invited_users, :string
  end
end
