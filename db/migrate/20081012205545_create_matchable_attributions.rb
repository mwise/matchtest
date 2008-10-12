class CreateMatchableAttributions < ActiveRecord::Migration
  def self.up
    create_table :matchable_attributions do |t|
      t.integer :matchable_id
      t.integer :matchable_attribute_id
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :matchable_attributions
  end
end
