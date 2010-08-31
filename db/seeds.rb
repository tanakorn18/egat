# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)



Brand.delete_all
open("db/brands.txt") do |brands|
  brands.read.each_line do |brand|
    Brand.create({:name => brand.strip})
  end
end

ApplicationUse.delete_all
open("db/initial_data/application_use.txt") do |application_uses|
  application_uses.read.each_line do |application_use|
    ApplicationUse.create({:value => application_use.strip})
  end
end

BusVoltageHv.delete_all
open("db/initial_data/bus_voltage_hv.txt") do |bus_voltage_hvs|
  bus_voltage_hvs.read.each_line do |bus_voltage_hv|
    BusVoltageHv.create({:value => bus_voltage_hv.strip})
  end
end

BusVoltageLv.delete_all
open("db/initial_data/bus_voltage_lv.txt") do |bus_voltage_lvs|
  bus_voltage_lvs.read.each_line do |bus_voltage_lv|
    BusVoltageLv.create({:value => bus_voltage_lv.strip})
  end
end

DamageOfProperty.delete_all
open("db/initial_data/damage_of_property.txt") do |damage_of_properties|
  damage_of_properties.read.each_line do |damage_of_property|
    value, message = damage_of_property.split(',')
    DamageOfProperty.create({:value => value.strip, :message => message.strip})                             
  end
end

Pollution.delete_all
open("db/initial_data/pollution.txt") do |pollutions|
  pollutions.read.each_line do |pollution|
    Pollution.create({:value => pollution.strip})
  end
end

ProbabilityOfForceOutage.delete_all
open("db/initial_data/probability_of_force_outage.txt") do |probability_of_force_outages|
  probability_of_force_outages.read.each_line do |probability_of_force_outage|
    ProbabilityOfForceOutage.create({:value => probability_of_force_outage.strip})
  end
end

SocialAspect.delete_all
open("db/initial_data/social_aspect.txt") do |social_aspects|
  social_aspects.read.each_line do |social_aspect|
    SocialAspect.create({:value => social_aspect.strip})
  end
end

SystemLocation.delete_all
open("db/initial_data/system_location.txt") do |system_locations|
  system_locations.read.each_line do |system_location|
    SystemLocation.create({:value => system_location.strip})
  end
end

SystemStability.delete_all
open("db/initial_data/system_stability.txt") do |system_stabilities|
  system_stabilities.read.each_line do |system_stability|
    SystemStability.create({:value => system_stability.strip})
  end
end
