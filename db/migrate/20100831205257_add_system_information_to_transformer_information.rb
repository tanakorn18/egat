class AddSystemInformationToTransformerInformation < ActiveRecord::Migration
  def self.up
    add_column :transformer_informations, :system_location_id, :integer
  end

  def self.down
    remove_column :transformer_informations, :system_location_id
  end
end