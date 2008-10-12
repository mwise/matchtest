class CreateMatchableAttributes < ActiveRecord::Migration
  def self.up
    create_table :matchable_attributes do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :matchable_attributes
  end
end
