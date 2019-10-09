class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :full_name
      t.string :username
      t.string :password
      t.integer :age
      t.string :city
      t.string :occupation
      t.string :company
      t.string :school

      t.timestamps
    end
  end
end
