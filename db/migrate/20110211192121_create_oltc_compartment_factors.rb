class CreateOltcCompartmentFactors < ActiveRecord::Migration
  def self.up
    create_table :oltc_compartment_factors do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color

      t.timestamps
    end
    OltcCompartmentFactor.create(:hi_factor => 4, :condition => "Good",
                                 :start => 0, :end => 35, :color => "0,255,0")

    OltcCompartmentFactor.create(:hi_factor => 3, :condition => "Acceptable",
                                 :start => 36, :end => 39, :color => "0,0,255")

    OltcCompartmentFactor.create(:hi_factor => 2, :condition => "Need Caution",
                                 :start => 40, :end => 43,
                                 :color => "0,255,255")

    OltcCompartmentFactor.create(:hi_factor => 1, :condition => "Poor",
                                 :start => 44, :end => 49,
                                 :color => "255,146,0")

    OltcCompartmentFactor.create(:hi_factor => 0, :condition => "Very Poor",
                                 :start => 50, :end => nil, :color => "255,0,0")

  end

  def self.down
    drop_table :oltc_compartment_factors
  end
end
