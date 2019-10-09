class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.references :user, foreign_key: true
      t.references :invite, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
