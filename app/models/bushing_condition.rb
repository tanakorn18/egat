# == Schema Information
# Schema version: 20110115144540
#
# Table name: bushing_conditions
#
#  id                  :integer(4)      not null, primary key
#  version             :integer(4)
#  test_by             :string(255)
#  test_date           :datetime
#  work_order          :string(255)
#  oil_color_hv        :integer(10)
#  oil_color_lv        :integer(10)
#  oil_color_tv        :integer(10)
#  oil_fail_hv         :integer(10)
#  oil_fail_lv         :integer(10)
#  oil_fail_tv         :integer(10)
#  oil_level_hv        :integer(10)
#  oil_level_lv        :integer(10)
#  oil_level_tv        :integer(10)
#  perform_type        :integer(10)
#  porcelain_clean_hv  :integer(10)
#  porcelain_clean_lv  :integer(10)
#  porcelain_clean_tv  :integer(10)
#  porcelain_status_hv :integer(10)
#  porcelain_status_lv :integer(10)
#  porcelain_status_tv :integer(10)
#  transformer_id      :integer(10)
#

class BushingCondition < ActiveRecord::Base
  belongs_to :transformer
end