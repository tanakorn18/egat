class CreateInsulatingOilFactors < ActiveRecord::Migration
  def self.up
    create_table :insulating_oil_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color_id                  
      t.timestamps
    end
  end

  def self.down
    drop_table :insulating_oil_factors
  end
end
