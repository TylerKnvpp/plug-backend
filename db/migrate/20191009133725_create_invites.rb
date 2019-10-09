class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.string :category
      t.string :time
      t.string :location

      t.timestamps
    end
  end
end
