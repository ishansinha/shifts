class CreateCagtegories < ActiveRecord::Migration
  def self.up
    create_table :cagtegories do |t|
      t.string :name
      t.boolean :active
      t.references :department
      t.timestamps
    end
  end
  
  def self.down
    drop_table :cagtegories
  end
end
