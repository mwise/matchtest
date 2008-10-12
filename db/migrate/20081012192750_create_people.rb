class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.integer :height
      t.integer :weight
      t.integer :age

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
