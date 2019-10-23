class RemoveColumnFromInvites < ActiveRecord::Migration[5.2]
  def change
    remove_column :invites, :accepted, :string
    remove_column :invites, :denied, :string
  end
end
