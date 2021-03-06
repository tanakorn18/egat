class CreateSurgeArresterConditions < ActiveRecord::Migration
  def self.up
    create_table :surge_arrester_conditions do |t|
      t.integer :hi_factor
      t.string :condition
      t.integer :start
      t.integer :end
      t.string :color
      t.timestamps
    end
    SurgeArresterCondition.create :hi_factor => 4, :condition => "Good",
                                   :start => 0, :end => 39, 
                                   :color => "0,255,0"
                                   
     SurgeArresterCondition.create :hi_factor => 3, :condition => "Acceptable",
                                   :start => 40, :end => 43, 
                                   :color => "0,0,255"
                                   
     SurgeArresterCondition.create :hi_factor => 2, :condition => "Need Caution",
                                   :start => 44, :end => 46, 
                                   :color => "0,255,255"
                                   
     SurgeArresterCondition.create :hi_factor => 1, :condition => "Poor",
                                   :start => 47, :end => 49, 
                                   :color => "255,146,0"
                                   
     SurgeArresterCondition.create :hi_factor => 0, :condition => "Very Poor",
                                   :start => 50, :end => nil, 
                                   :color => "255,0,0"
    
  end

  def self.down
    drop_table :surge_arrester_conditions
  end
end
