require 'spec_helper'

describe InsulatingOil do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: insulating_oils
#
#  id                    :integer(4)      not null, primary key
#  version               :integer(4)
#  ambient_temp          :float
#  cf                    :float
#  current_avg_maintank  :float
#  current_avg_oltc      :float
#  gap_distance_maintank :float
#  gap_distance_oltc     :float
#  humidity              :float
#  oil_temp              :float
#  remark_maintank       :string(255)
#  remark_oltc           :string(255)
#  test_by               :string(255)
#  test_date             :datetime
#  watt_avg_maintank     :float
#  watt_avg_oltc         :float
#  work_order            :string(255)
#  xi1_maintank          :float
#  xi1_oltc              :float
#  xi2_maintank          :float
#  xi2_oltc              :float
#  xi3_maintank          :float
#  xi3_oltc              :float
#  xi4_maintank          :float
#  xi4_oltc              :float
#  xi5_maintank          :float
#  xi5_oltc              :float
#  perform_type          :integer(10)
#  test_type             :string(255)
#  transformer_id        :integer(4)
#  test_kv_maintank      :integer(4)
#  test_kv_oltc          :integer(4)
#

